# frozen_string_literal: true

require_relative 'base'

module LangSvr
  module Protocol
    class TextDocumentContentChangeEvent < Base
      lsp_attribute :range, Range, optional: true
      lsp_attribute :rangeLength, Integer, optional: true
      lsp_attribute :text, String
    end
  end
end
