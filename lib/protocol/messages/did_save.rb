# frozen_string_literal: true

require_relative '../did_save_text_document_params'

module LangSvr
  module Protocol
    module Messages
      class DidSave < NotificationMessage
        lsp_const :method, 'textDocument/didSave'
        lsp_attribute :params, DidSaveTextDocumentParams

        def process_message
          raise NotImplementedError
        end
      end
    end
  end
end
