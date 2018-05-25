# frozen_string_literal: true

require_relative 'base'

module Protocol
  class WorkspaceClientCapabilities < Base
    lsp_attribute :applyEdit, Object, optional: true, in: [true, false]
    lsp_attribute :workspaceEdit, Hash, optional: true
    lsp_attribute :didChangeConfiguration, Hash, optional: true
    lsp_attribute :symbol, Hash, optional: true
    lsp_attribute :executeCommand, Hash, optional: true
    lsp_attribute :workspaceFolders, Object, optional: true, in: [true, false]
    lsp_attribute :configuration, Object, optional: true, in: [true, false]
  end
end
