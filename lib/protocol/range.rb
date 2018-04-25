require_relative 'position'

module Protocol
  class Range < Base
    lsp_attribute :start, Position
    lsp_attribute :end, Position
  end
end
