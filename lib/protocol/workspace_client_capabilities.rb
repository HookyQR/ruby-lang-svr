# frozen_string_literal: true

require_relative 'base'

module Protocol
  class WorkspaceClientCapabilities < Base
    lsp_attribute :applyEdit, [TrueClass, FalseClass], optional: true
    lsp_attribute :workspaceEdit, Hash, optional: true
    lsp_attribute :didChangeConfiguration, Hash, optional: true
    lsp_attribute :didChangeWatchedFiles, Hash, optional: true
    lsp_attribute :symbol, Hash, optional: true
    lsp_attribute :executeCommand, Hash, optional: true
    lsp_attribute :workspaceFolders, [TrueClass, FalseClass], optional: true
    lsp_attribute :configuration, [TrueClass, FalseClass], optional: true
  end
end
