# frozen_string_literal: true

require 'protocol/util/json'

RSpec.describe Protocol::Util::JSON do
  subject(:json) { described_class.new(object) }
  let(:object) { 5 }

  describe '.call' do
    subject(:result) { json.call }

    context 'plain object' do
      it { is_expected.to eq object.to_s }
    end

    context 'array' do
      let(:object) { [1, 2] }

      before do
        expect(object).to receive(:map).and_call_original
      end

      it { is_expected.to eq '[1,2]' }
    end

    context 'hash' do
      # note: for our uses, nil represents an un-filled optional value
      #  use Protocol::
      let(:object) { { a: 1, b: 'test', c: nil } }

      before do
        expect(object).to receive(:map).and_call_original
      end

      it { is_expected.to eq '{"a":1,"b":"test"}' }

      context 'nested' do
        let(:object) { { a: nested_object, b: nested_array } }
        let(:nested_object) { {a:2} }
        let(:nested_array) { [:b, 3] }
        before do
          expect(nested_object).to receive(:map).and_call_original
          expect(nested_array).to receive(:map).and_call_original
        end
        it { is_expected.to eq '{"a":{"a":2},"b":["b",3]}' }
      end
    end
  end
end
