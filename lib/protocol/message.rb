# frozen-string-literal: true

require_relative 'base'

module Protocol
  class Message < Base
    lsp_attribute :jsonrpc, '2.0'
  end
end
