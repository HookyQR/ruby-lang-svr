# frozen_string_literal: true

require_relative 'base'
require_relative 'workspace_client_capabilities'
require_relative 'text_document_client_capabilities'

module Protocol
  class ClientCapabilities < Base
    lsp_attribute :workspace, WorkspaceClientCapabilities, optional: true
    lsp_attribute :textDocument, TextDocumentClientCapabilities, optional: true
    lsp_attribute :experimental, Object, optional: true
  end
end
