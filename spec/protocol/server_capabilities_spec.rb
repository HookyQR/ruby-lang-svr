# frozen_string_literal: true

require 'protocol/server_capabilities'

RSpec.describe LangSvr::Protocol::ServerCapabilities do
  let(:readable) { %i[] }
  let(:writeable) { %i[hoverProvider] }

  include_examples 'protocol component', LangSvr::Protocol::Base

  xit { is_expected.to include(:hoverProvider) }
end
