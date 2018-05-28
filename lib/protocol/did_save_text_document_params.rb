# frozen_string_literal: true

require_relative 'versioned_text_document_identifier'

module Protocol
  class DidSaveTextDocumentParams < Base
    lsp_attribute :textDocument, VersionedTextDocumentIdentifier
    lsp_attribute :text, String, optional: true
  end
end
