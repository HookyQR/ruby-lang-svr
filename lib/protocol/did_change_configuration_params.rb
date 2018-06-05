# frozen_string_literal: true

require_relative 'base'

module LangSvr
  module Protocol
    class DidChangeConfigurationParams < Base
      lsp_attribute :settings, Hash
    end
  end
end
