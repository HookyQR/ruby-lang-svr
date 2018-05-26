# frozen_string_literal: true

require 'protocol/request_message'

RSpec.describe Protocol::RequestMessage do
  let(:readable) { %i[] }
  let(:writeable) { %i[id method params] }

  include_examples 'protocol component', Protocol::Message
end
