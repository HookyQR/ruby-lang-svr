# frozen_string_literal: true

require_relative '../did_change_configuration_params'

module Protocol
  module Messages
    class DidChangeConfiguration < NotificationMessage
      lsp_const :method, 'workspace/didChangeConfiguration'
      lsp_attribute :params, DidChangeConfigurationParams

      def process_message
        raise NotImplementedError
      end
    end
  end
end
