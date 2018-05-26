# frozen_string_literal: true

require_relative 'base'
require_relative 'workspace_client_capabilities'
require_relative 'text_document_client_capabilities'

module Protocol
  class ServerCapabilities < Base
    # we can determine what gets sent here.

    # lsp_attribute :textDocumentSync, TextDocumentSyncOptions, optional: true
    lsp_attribute :textDocumentSync, Numeric, optional: true
    lsp_attribute :hoverProvider, [TrueClass, FalseClass], optional: true
    # lsp_attribute :completionProvider, CompletionOptions, optional: true
    # lsp_attribute :signatureHelpProvider, SignatureHelpOptions, optional: true
    lsp_attribute :definitionProvider, [TrueClass, FalseClass], optional: true
    # lsp_attribute :typeDefinitionProvider, [TrueClass, FalseClass, (TextDocumentRegistrationOptions & StaticRegistrationOptions)], optional: true
    # lsp_attribute :implementationProvider, [TrueClass, FalseClass, (TextDocumentRegistrationOptions & StaticRegistrationOptions)], optional: true
    lsp_attribute :referencesProvider, [TrueClass, FalseClass], optional: true
    # lsp_attribute :documentHighlightProvider, [TrueClass, FalseClass], optional: true
    lsp_attribute :documentSymbolProvider, [TrueClass, FalseClass], optional: true
    lsp_attribute :workspaceSymbolProvider, [TrueClass, FalseClass], optional: true
    lsp_attribute :codeActionProvider, [TrueClass, FalseClass], optional: true
    # lsp_attribute :codeLensProvider, CodeLensOptions, optional: true
    lsp_attribute :documentFormattingProvider, [TrueClass, FalseClass], optional: true
    lsp_attribute :documentRangeFormattingProvider, [TrueClass, FalseClass], optional: true
    # lsp_attribute :documentOnTypeFormattingProvider, DocumentOnTypeFormattingOptions, optional: true
    lsp_attribute :renameProvider, [TrueClass, FalseClass], optional: true
    # lsp_attribute :documentLinkProvider, DocumentLinkOptions, optional: true
    # lsp_attribute :colorProvider, [TrueClass, FalseClass, ColorProviderOptions, (ColorProviderOptions & TextDocumentRegistrationOptions & StaticRegistrationOptions)], optional: true
    # lsp_attribute :executeCommandProvider, ExecuteCommandOptions, optional: true
    lsp_attribute :workspace, Hash, optional: true # { workspaceFolders?: { supported?: boolean; changeNotifications?: string | boolean; }
    lsp_attribute :experimental, Object, optional: true
  end
end
