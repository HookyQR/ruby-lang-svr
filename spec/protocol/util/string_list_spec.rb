# frozen_string_literal: true

require 'protocol/util/string_list'

RSpec.describe LangSvr::Protocol::Util::StringList do
  subject(:string_list) { described_class.new(values) }
  let(:values) { [] }

  describe '.call' do
    subject(:result) { string_list.call }

    context 'empty array' do
      it { is_expected.to eq '' }
    end

    context 'single object' do
      let(:values) { [Class] }

      it { is_expected.to eq 'Class' }
    end

    context 'two objects' do
      let(:values) { [Class, Object] }

      it 'lists the elements with an "or"' do
        is_expected.to eq 'Class or Object'
      end
    end

    context 'more than three objects' do
      let(:values) { [Class, Object, NilClass] }

      it 'lists the elements with comma and an "or"' do
        is_expected.to eq 'Class, Object or NilClass'
      end
    end
  end
end
