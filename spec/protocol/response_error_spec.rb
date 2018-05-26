# frozen_string_literal: true

require 'protocol/response_error'

RSpec.describe Protocol::ResponseError do
  let(:readable) { %i[] }
  let(:writeable) { %i[code message data] }

  include_examples 'protocol component', Protocol::Base
end
