# frozen_string_literal: true

require_relative 'base'

module Protocol
  class TextDocumentIdentifier < Base
    lsp_attribute :uri, String
  end
end
