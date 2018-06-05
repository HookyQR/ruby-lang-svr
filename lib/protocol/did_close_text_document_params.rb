# frozen_string_literal: true

require_relative 'text_document_identifier'

module LangSvr
  module Protocol
    class DidCloseTextDocumentParams < Base
      lsp_attribute :textDocument, TextDocumentIdentifier
    end
  end
end
