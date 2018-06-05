# frozen_string_literal: true

require 'protocol/util/is_one_of'

RSpec.describe LangSvr::Protocol::Util::IsOneOf do
  subject(:is_one_of) { described_class.new(value, candidates) }
  let(:value) { 5 }
  let(:candidates) { [Numeric, String] }

  describe '.call' do
    subject(:result) { is_one_of.call }

    context 'when matched' do
      it { is_expected.to be_truthy }
    end

    context 'not in list' do
      let(:value) { nil }

      it { is_expected.to be_falsey }
    end
  end
end
