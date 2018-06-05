# frozen_string_literal: true

require_relative 'file_event'

module LangSvr
  module Protocol
    class DidChangeWatchedFilesParams < Base
      lsp_attribute :changes, FileEvent, array: true
    end
  end
end
