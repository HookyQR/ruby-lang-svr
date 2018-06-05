# frozen_string_literal: true

require 'protocol/array'
require 'protocol/base'

class TestClass < LangSvr::Protocol::Base
  lsp_attribute :array, Integer, array: true
end

RSpec.describe LangSvr::Protocol::Array do
  subject(:array) { test.array }
  let(:test) { TestClass.new(array: input) }
  let(:input) { [1, 2] }

  describe 'setting whole' do
    context 'empty' do
      let(:input) { [] }

      it { expect { array }.not_to raise_error }
    end

    context 'matching types' do
      let(:input) { [1, 2] }

      it { expect { array }.not_to raise_error }
    end

    context 'non-matching types' do
      let(:input) { [1, ''] }

      it { expect { array }.to raise_error(StandardError, /is not a/) }
    end

    context 'set from a LangSvr::Protocol::Array' do
      let(:input) { LangSvr::Protocol::Array.new(1, 1) }

      it { expect { test.array = array }.not_to raise_error }
    end
  end

  describe 'setting internal' do
    context 'matching type' do
      it { expect { test.array[0] = 1 }.not_to raise_error }
      it { expect { test.array << 1 }.to change(test.array, :length).by 1 }
      it { expect { test.array.push(1) }.to change(test.array, :length).by 1 }
    end

    context 'non-matching type' do
      it { expect { test.array[0] = 'a' }.to raise_error(StandardError) }
      it { expect { test.array << 'a' }.to raise_error(StandardError) }
      it { expect { test.array.push('a') }.to raise_error(StandardError) }
    end

    context 'without an intial array' do
      let(:test) { TestClass.new }

      it { expect { test.array << 1 }.not_to raise_error }
    end
  end
end
