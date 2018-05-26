# frozen_string_literal: true

require 'protocol/message'

RSpec.describe Protocol::Message do
  let(:readable) { %i[jsonrpc] }
  let(:writeable) { %i[] }

  include_examples 'protocol component', Protocol::Base
end
