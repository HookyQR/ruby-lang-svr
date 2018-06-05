# frozen_string_literal: true

require_relative 'position'

module LangSvr
  module Protocol
    class Range < Base
      lsp_attribute :start, Position
      lsp_attribute :end, Position
    end
  end
end
