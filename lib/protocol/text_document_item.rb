# frozen_string_literal: true

require_relative 'text_document_identifier'

module LangSvr
  module Protocol
    class TextDocumentItem < TextDocumentIdentifier
      lsp_attribute :languageId, String
      lsp_attribute :version, Numeric
      lsp_attribute :text, String
    end
  end
end
