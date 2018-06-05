# frozen_string_literal: true

require_relative 'text_document_identifier'
require_relative 'position'

module LangSvr
  module Protocol
    class TextDocumentPositionParams < Base
      lsp_attribute :textDocument, TextDocumentIdentifier
      lsp_attribute :position, Position
    end
  end
end
