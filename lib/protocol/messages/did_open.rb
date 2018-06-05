# frozen_string_literal: true

require_relative '../did_open_text_document_params'

module LangSvr
  module Protocol
    module Messages
      class DidOpen < NotificationMessage
        lsp_const :method, 'textDocument/didOpen'
        lsp_attribute :params, DidOpenTextDocumentParams

        def process_message
          raise NotImplementedError
        end
      end
    end
  end
end
