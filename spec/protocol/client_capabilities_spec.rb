# frozen_string_literal: true

require 'protocol/client_capabilities'

RSpec.describe LangSvr::Protocol::ClientCapabilities do
  let(:readable) { %i[] }
  let(:writeable) { %i[workspace textDocument experimental] }

  include_examples 'protocol component', LangSvr::Protocol::Base
end
