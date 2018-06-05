# frozen_string_literal: true

require_relative '../did_close_text_document_params'

module LangSvr
  module Protocol
    module Messages
      class DidClose < NotificationMessage
        lsp_const :method, 'textDocument/didClose'
        lsp_attribute :params, DidCloseTextDocumentParams

        def process_message
          raise NotImplementedError
        end
      end
    end
  end
end
