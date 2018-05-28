# frozen_string_literal: true

require 'protocol/messages/did_save'

RSpec.describe Protocol::Messages::DidSave do
  let(:readable) { %i[method] }
  let(:writeable) { %i[params] }

  include_examples 'protocol component', Protocol::Base
end
