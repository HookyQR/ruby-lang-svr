# frozen_string_literal: true

require 'protocol/base'

RSpec.describe Protocol::Base do
  after do
    module Protocol
      class Base
        instance_variable_get(:@lsp_attrs).each do |name, _|
          remove_method(name) if method_defined? name
          remove_method("#{name}=") if method_defined? "#{name}="
        end

        @lsp_attrs = {}
      end
    end
  end

  subject(:base_class) { Protocol::Base }

  let(:key) { :key }
  let(:types) { String }
  let(:opts) { { optional: true } }

  describe '#lsp_attribute' do
    subject(:lsp_attribute) { base_class.lsp_attribute(key, types, opts) }

    context 'happy case' do
      it { expect { lsp_attribute }.not_to raise_error }

      context 'with multiple types' do
        let(:types) { [String, Integer] }
        it { expect { lsp_attribute }.not_to raise_error }
      end

      context 'with array types' do
        let(:opts) { { array: true } }

        it { expect { lsp_attribute }.not_to raise_error }
      end
    end

    context 'no types set' do
      let(:types) { [] }
      it { expect { lsp_attribute }.to raise_error(StandardError, /must have at least one/) }
    end

    context 'a non-class in types set' do
      let(:types) { [1] }
      it { expect { lsp_attribute }.to raise_error(StandardError, /must all be classes/) }
    end

    context 'a value instead of a type (const set)' do
      after { base_class.send(:remove_const, :KEY) }

      let(:types) { 1 }
      it { expect { lsp_attribute }.not_to raise_error }

      context 'with nil' do
        let(:types) { nil }
        before { expect(Protocol::NULL).to receive(:new).and_call_original }

        it { expect { lsp_attribute }.not_to raise_error }
      end
    end
  end

  describe '#lsp_attrs' do
    subject(:lsp_attrs) { base_class.lsp_attrs }
    before { base_class.lsp_attribute(key, types, opts) }

    context 'basic case' do
      it { is_expected.to include(key => a_hash_including(opts)) }
    end

    context 'inherited' do
      class T < Protocol::Base
        lsp_attribute :key2, 'Test'
      end

      subject(:lsp_attrs) { T.lsp_attrs }

      it { is_expected.to include(key => a_hash_including(opts)) }
      it { is_expected.to include(:key2) }

      it 'orders base classes first' do
        expect(lsp_attrs.keys).to eq [key, :key2]
      end
    end
  end

  describe 'instance' do
    before do
      base_class.lsp_attribute(:key1, String, optional: true)
      base_class.lsp_attribute(:key2, Integer, in: [1, 2, 3])
      base_class.lsp_attribute(:key3, [Integer, NilClass])
      base_class.lsp_attribute(:key4, [Integer, NilClass], array: true)
    end

    subject(:base) { base_class.new(key1: 'test', key2: 3, key3: nil, key4: [1, 2, 3]) }

    describe 'setting' do
      it "can set to it's type" do
        expect(base.key1 = 'new value').to eq 'new value'
        expect(base.key1).to eq 'new value'
        expect(base.key4 = [5, 6]).to eq [5, 6]
        expect(base.key4).to eq [5, 6]
      end

      it "won't set to something else" do
        expect { base.key1 = 5 }.to raise_error(StandardError, /'5' is not a String/)
        expect { base.key4 = 5 }.to raise_error(StandardError, /'5' is not an Array/)
      end

      context 'array internal setting' do
        it { expect { base.key4 = ['no'] }.to raise_error(StandardError, /'no' is not a/) }
      end

      it "won't set to something outside of it's `:in` setting" do
        expect { base.key2 = 1 }.not_to raise_error
        expect { base.key2 = 4 }.to raise_error(StandardError, /must be one of/)
      end

      it 'can nullify an optional' do
        expect { base.key1 = nil }.not_to raise_error
      end

      it 'can not nullify a required' do
        expect { base.key2 = nil }.to raise_error(StandardError, /not optional.*can not be nil/)
      end
    end

    describe 'retrieving' do
      context 'when a required value is unset' do
        subject(:base) { base_class.new(key1: 'test') }

        it 'will fail lookup' do
          expect { base.key2 }.to raise_error(StandardError, /Non-optional.*not set/)
        end
      end
    end

    describe '.to_s' do
      subject(:string) { base.to_s }

      it { is_expected.to eq '{"key1":"test","key2":3,"key3":null,"key4":[1,2,3]}' }

      context 'with an empty optional' do
        before { base.key1 = nil }

        it { is_expected.to eq '{"key2":3,"key3":null,"key4":[1,2,3]}' }
      end
    end
  end
end
