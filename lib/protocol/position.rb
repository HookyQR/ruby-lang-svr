require_relative 'base'

module Protocol
  class Position < Base
    lsp_attribute :line, Integer
    lsp_attribute :character, Integer
  end
end
