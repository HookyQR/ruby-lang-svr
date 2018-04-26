# frozen_string_literal: true

require 'protocol/response_error'

RSpec.describe Protocol::ResponseError do
  subject(:response_error) { described_class.new }

  it { is_expected.to be_a Protocol::Base }

  describe 'interface' do
    subject(:methods) { response_error.methods }

    it { is_expected.to include(:code, :message, :data) }
    it { is_expected.to include(:code=, :message=, :data=) }
  end

  describe '#to_s' do
    subject(:string) { response_error.to_s }
    before do
      response_error.code = Protocol::ErrorCodes::UNKNOWN_ERROR_CODE
      response_error.message = 'test'
    end

    it { is_expected.to include('"message":"test"', '"code":-32001') }
    it { is_expected.not_to include('"data":') }
  end
end
