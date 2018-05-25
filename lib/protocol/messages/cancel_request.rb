# frozen_string_literal: true

require_relative '../notification_message'
require_relative '../cancel_params'

module Protocol
  module Messages
    class CancelRequest < NotificationMessage
      lsp_const :method, '$/cancelRequest'
      # lsp_attribute :params, CancelParams

      def initialize(id:)
        super(params: CancelParams.new(id: id))
      end
    end
  end
end
