# frozen-string-literal: true

require_relative 'base'

module LangSvr
  module Protocol
    class Message < Base
      lsp_const :jsonrpc, '2.0'
    end
  end
end
