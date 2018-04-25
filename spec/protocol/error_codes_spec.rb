# frozen_string_literal: true

require 'protocol/error_codes'

RSpec.describe Protocol::ErrorCodes do
  subject(:error_codes) { Protocol::ErrorCodes }

  it 'has the 10 error codes' do
    expect(error_codes.valid_codes.count).to eq 10
  end
end
