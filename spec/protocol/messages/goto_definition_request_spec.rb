# frozen_string_literal: true

require 'protocol/messages/goto_definition_request'

RSpec.describe Protocol::Messages::GotoDefintionRequest do
  let(:readable) { %i[method] }
  let(:writeable) { %i[params] }

  include_examples 'protocol component', Protocol::RequestMessage
end
