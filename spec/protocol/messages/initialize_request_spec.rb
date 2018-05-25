# frozen_string_literal: true

require 'protocol/messages/initialize_request'

RSpec.describe Protocol::Messages::InitializeRequest do
  subject(:init_request) { described_class.new(id: 1, params: init_params) }

  let(:init_params) { Protocol::InitializeParams.new(processId: 1, rootUri: 'file', capabilities: client_caps) }
  let(:client_caps) { Protocol::ClientCapabilities.new }
  it { is_expected.to be_a Protocol::RequestMessage }

  describe 'interface' do
    subject(:methods) { init_request.methods }

    it { is_expected.to include(:method, :params) }
    it { is_expected.to include(:params=) }
  end

  describe '#to_s' do
    subject(:string) { init_request.to_s }

    it { is_expected.to include('"jsonrpc":"2.0"', '"method":"initialize"', '"id":1', '"params":{') }
  end
end
