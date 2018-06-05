# frozen_string_literal: true

require 'protocol/workspace_client_capabilities'

RSpec.describe LangSvr::Protocol::WorkspaceClientCapabilities do
  let(:readable) { %i[] }
  let(:writeable) { %i[applyEdit workspaceEdit didChangeConfiguration symbol executeCommand workspaceFolders configuration] }

  include_examples 'protocol component', LangSvr::Protocol::Base
end
