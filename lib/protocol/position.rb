# frozen_string_literal: true

require_relative 'base'

module LangSvr
  module Protocol
    class Position < Base
      lsp_attribute :line, Integer
      lsp_attribute :character, Integer
    end
  end
end
