# frozen_string_literal: true

require_relative 'text_document_item'

module LangSvr
  module Protocol
    class DidOpenTextDocumentParams < Base
      lsp_attribute :textDocument, TextDocumentItem
    end
  end
end
