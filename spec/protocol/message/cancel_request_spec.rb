# frozen_string_literal: true

require 'protocol/message/cancel_request'

RSpec.describe Protocol::Messages::CancelRequest do
  subject(:cancel_request) { described_class.new(id: 5) }

  it { is_expected.to be_a Protocol::NotificationMessage }

  describe 'interface' do
    subject(:methods) { cancel_request.methods }

    it { is_expected.to include(:method, :params) }
    it { is_expected.to include(:params=) }
  end

  describe '#to_s' do
    subject(:string) { cancel_request.to_s }

    it { is_expected.to include('"jsonrpc":"2.0"', '"method":"$/cancelRequest"', '"params":{"id":5}') }
  end
end
