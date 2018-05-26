# frozen_string_literal: true

require 'protocol/messages/did_change_configuration'

RSpec.describe Protocol::Messages::DidChangeConfiguration do
  let(:readable) { %i[method] }
  let(:writeable) { %i[params] }

  include_examples 'protocol component', Protocol::Base
end
