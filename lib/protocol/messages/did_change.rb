# frozen_string_literal: true

require_relative '../did_change_text_document_params'

module LangSvr
  module Protocol
    module Messages
      class DidChange < NotificationMessage
        lsp_const :method, 'textDocument/didChange'
        lsp_attribute :params, DidChangeTextDocumentParams

        def process_message
          raise NotImplementedError
        end
      end
    end
  end
end
