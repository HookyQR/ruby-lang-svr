# frozen_string_literal: true

require_relative '../did_change_watched_files_params'

module LangSvr
  module Protocol
    module Messages
      class DidChangeWatchedFiles < NotificationMessage
        lsp_const :method, 'workspace/didChangeWatchedFiles'
        lsp_attribute :params, DidChangeWatchedFilesParams

        def process_message
          raise NotImplementedError
        end
      end
    end
  end
end
