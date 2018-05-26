# frozen_string_literal: true

require_relative '../notification_message'

module Protocol
  module Messages
    class InitializedNotification < NotificationMessage
      lsp_const :method, 'initialized'
    end
  end
end
