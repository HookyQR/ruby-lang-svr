# frozen_string_literal: true

require 'protocol/response_message'

RSpec.describe Protocol::ResponseMessage do
  subject(:response_message) { described_class.new }

  it { is_expected.to be_a Protocol::Message }

  describe 'interface' do
    subject(:methods) { response_message.methods }

    it { is_expected.to include(:id, :result, :error) }
    it { is_expected.to include(:id=, :result=, :error=) }
  end

  describe '#to_s' do
    subject(:string) { response_message.to_s }
    before do
      response_message.id = 1
      response_message.result = 'test'
    end

    it { is_expected.to include('jsonrpc:"2.0"', 'result:"test"', 'id:1') }
    it { is_expected.not_to include('error') }

    context 'error set' do
      before { response_message.error = Protocol::ResponseError.new(code: Protocol::ErrorCodes::UNKNOWN_ERROR_CODE, message: '') }

      it { is_expected.to match(/,error:\{.*\}/) }
    end
  end
end
