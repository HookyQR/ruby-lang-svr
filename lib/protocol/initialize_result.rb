# frozen_string_literal: true

require_relative 'server_capabilities'

module LangSvr
  module Protocol
    class InitializeResult < Base
      lsp_attribute :capabilities, ServerCapabilities
    end
  end
end
