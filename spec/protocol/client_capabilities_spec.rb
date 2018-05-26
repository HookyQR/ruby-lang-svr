# frozen_string_literal: true

require 'protocol/client_capabilities'

RSpec.describe Protocol::ClientCapabilities do
  let(:readable) { %i[] }
  let(:writeable) { %i[workspace textDocument experimental] }

  include_examples 'protocol component', Protocol::Base
end
