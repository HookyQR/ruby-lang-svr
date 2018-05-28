# frozen_string_literal: true

require_relative 'text_document_identifier'

module Protocol
  class DidCloseTextDocumentParams < Base
    lsp_attribute :textDocument, TextDocumentIdentifier
  end
end
