# frozen_string_literal: true

require 'protocol/response_message'

RSpec.describe Protocol::ResponseMessage do
  let(:readable) { %i[] }
  let(:writeable) { %i[id result error] }

  include_examples 'protocol component', Protocol::Message
end
