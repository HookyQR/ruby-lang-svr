# frozen_string_literal: true

require_relative 'client_capabilities'

module Protocol
  class InitializeParams < Base
    lsp_attribute :processId, Integer, NilClass
    lsp_attribute :rootPath, String, NilClass, optional: true
    lsp_attribute :rootUri, String, NilClass
    lsp_attribute :initializationOptions, Object, optional: true
    lsp_attribute :capabilities, ClientCapabilities
    lsp_attribute :trace, String, optional: true, in: %w[off messages verbose]
    lsp_attribute :workspaceFolders, ::Array, NilClass, optional: true
  end
end
