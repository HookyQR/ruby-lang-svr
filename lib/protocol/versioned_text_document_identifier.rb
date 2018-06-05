# frozen_string_literal: true

require_relative 'text_document_identifier'

module LangSvr
  module Protocol
    class VersionedTextDocumentIdentifier < TextDocumentIdentifier
      lsp_attribute :version, Integer, NilClass
    end
  end
end
