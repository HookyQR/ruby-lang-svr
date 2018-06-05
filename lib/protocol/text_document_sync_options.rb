# frozen_string_literal: true

require_relative 'save_options'

module Protocol
  class TextDocumentSyncOptions < Base
    lsp_attribute :openClose, TrueClass, FalseClass, optional: true
    lsp_attribute :change, Numeric, optional: true
    lsp_attribute :willSave, TrueClass, FalseClass, optional: true
    lsp_attribute :willSaveWaitUntil, TrueClass, FalseClass, optional: true
    lsp_attribute :save, SaveOptions, optional: true
  end
end
