# frozen_string_literal: true

require_relative '../request_message'
require_relative '../initialize_params'

module LangSvr
  module Protocol
    module Messages
      class InitializeRequest < RequestMessage
        lsp_const :method, 'initialize'
        lsp_attribute :params, InitializeParams
      end
    end
  end
end
