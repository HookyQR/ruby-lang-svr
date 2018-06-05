# frozen_string_literal: true

require_relative 'text_document_identifier'

module LangSvr
  module Protocol
    class FileEvent < TextDocumentIdentifier
      lsp_attribute :type, Integer, in: [1, 2, 3]
      # Created = 1
      # Changed = 2
      # Deleted = 3
    end
  end
end
