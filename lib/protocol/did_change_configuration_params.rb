# frozen_string_literal: true

require_relative 'base'

module Protocol
  class DidChangeConfigurationParams < Base
    lsp_attribute :settings, Hash
  end
end
