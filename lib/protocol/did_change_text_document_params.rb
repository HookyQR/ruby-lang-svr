# frozen_string_literal: true

require_relative 'base'
require_relative 'versioned_text_document_identifier'
require_relative 'text_document_content_change_event'

module Protocol
  class DidChangeTextDocumentParams < Base
    lsp_attribute :textDocument, VersionedTextDocumentIdentifier
    lsp_attribute :contentChanges, TextDocumentContentChangeEvent, array: true
  end
end
