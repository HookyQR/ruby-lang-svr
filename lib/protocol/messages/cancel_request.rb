# frozen_string_literal: true

require_relative '../notification_message'
require_relative '../cancel_params'

module LangSvr
  module Protocol
    module Messages
      class CancelRequest < NotificationMessage
        lsp_const :method, '$/cancelRequest'
        lsp_attribute :params, CancelParams
      end
    end
  end
end
