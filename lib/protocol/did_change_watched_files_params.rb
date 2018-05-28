# frozen_string_literal: true

require_relative 'file_event'

module Protocol
  class DidChangeWatchedFilesParams < Base
    lsp_attribute :changes, FileEvent, array: true
  end
end
