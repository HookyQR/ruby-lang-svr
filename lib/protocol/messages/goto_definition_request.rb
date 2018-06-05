# frozen_string_literal: true

require_relative '../request_message'
require_relative '../text_document_position_params'

module LangSvr
  module Protocol
    module Messages
      class GotoDefintionRequest < RequestMessage
        lsp_const :method, 'textDocument/definition'
        lsp_attribute :params, TextDocumentPositionParams

        def process_message
          raise NotImplementedError
        end
      end
    end
  end
end
