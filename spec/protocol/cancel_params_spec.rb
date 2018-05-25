# frozen_string_literal: true

require 'protocol/cancel_params'

RSpec.describe Protocol::CancelParams do
  subject(:cancel_params) { described_class.new }

  it { is_expected.to be_a Protocol::Base }

  describe 'interface' do
    subject(:methods) { cancel_params.methods }

    it { is_expected.to include(:id) }
    it { is_expected.to include(:id=) }
  end

  describe '#to_s' do
    subject(:string) { cancel_params.to_s }
    before { cancel_params.id = 'test' }

    it { is_expected.to include('"id":"test"') }
  end
end
