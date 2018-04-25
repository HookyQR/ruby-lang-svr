# frozen_string_literal: true

require 'protocol/message'

RSpec.describe Protocol::Message do
  subject(:message) { described_class.new }

  it { is_expected.to be_a Protocol::Base }

  describe 'interface' do
    subject(:methods) { message.methods }

    it { is_expected.to include(:jsonrpc) }
    it { is_expected.not_to include(:jsonrpc=) }
  end

  describe '#to_s' do
    subject(:string) { message.to_s }
    it { is_expected.to eq '{jsonrpc:"2.0"}' }
  end
end
