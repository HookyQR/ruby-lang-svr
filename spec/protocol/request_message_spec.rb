# frozen_string_literal: true

require 'protocol/request_message'

RSpec.describe Protocol::RequestMessage do
  subject(:request_message) { described_class.new }

  it { is_expected.to be_a Protocol::Message }

  describe 'interface' do
    subject(:methods) { request_message.methods }
    it { is_expected.to include(:id, :method, :params) }
    it { is_expected.to include(:id=, :method=, :params=) }
  end

  describe '#to_s' do
    subject(:string) { request_message.to_s }
    before do
      request_message.id = 1
      request_message.method = 'test'
    end

    it { is_expected.to include('"jsonrpc":"2.0"', '"method":"test"', '"id":1') }
    it { is_expected.not_to include('params') }

    context 'params set' do
      before { request_message.params = 'paramTest' }
      it { is_expected.to include('"jsonrpc":"2.0"', '"method":"test"', '"id":1', '"params":"paramTest"') }
    end
  end
end
