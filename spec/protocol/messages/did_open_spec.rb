# frozen_string_literal: true

require 'protocol/messages/did_open'

RSpec.describe Protocol::Messages::DidOpen do
  let(:readable) { %i[method] }
  let(:writeable) { %i[params] }

  include_examples 'protocol component', Protocol::Base
end
