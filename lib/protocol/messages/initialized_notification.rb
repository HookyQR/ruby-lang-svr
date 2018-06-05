# frozen_string_literal: true

require_relative '../notification_message'

module LangSvr
  module Protocol
    module Messages
      class InitializedNotification < NotificationMessage
        lsp_const :method, 'initialized'

        def process_message; end
      end
    end
  end
end
