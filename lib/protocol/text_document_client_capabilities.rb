# frozen_string_literal: true

require_relative 'base'

module Protocol
  class TextDocumentClientCapabilities < Base
    lsp_attribute :synchronization, Hash, optional: true
    lsp_attribute :completion, Hash, optional: true
    lsp_attribute :hover, Hash, optional: true
    lsp_attribute :signatureHelp, Hash, optional: true
    lsp_attribute :references, Hash, optional: true
    lsp_attribute :documentHighlight, Hash, optional: true
    lsp_attribute :documentSymbol, Hash, optional: true
    lsp_attribute :formatting, Hash, optional: true
    lsp_attribute :rangeFormatting, Hash, optional: true
    lsp_attribute :onTypeFormatting, Hash, optional: true
    lsp_attribute :definition, Hash, optional: true
    lsp_attribute :typeDefinition, Hash, optional: true
    lsp_attribute :implementation, Hash, optional: true
    lsp_attribute :codeAction, Hash, optional: true
    lsp_attribute :codeLens, Hash, optional: true
    lsp_attribute :documentLink, Hash, optional: true
    lsp_attribute :colorProvider, Hash, optional: true
    lsp_attribute :rename, Hash, optional: true
    lsp_attribute :publishDiagnostics, Hash, optional: true
  end
end
