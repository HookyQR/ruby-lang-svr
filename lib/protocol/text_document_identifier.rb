# frozen_string_literal: true

require_relative 'base'

module LangSvr
  module Protocol
    class TextDocumentIdentifier < Base
      lsp_attribute :uri, String
    end
  end
end
