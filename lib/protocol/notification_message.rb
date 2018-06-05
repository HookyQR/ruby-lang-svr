# frozen-string-literal: true

require_relative 'message'

module LangSvr
  module Protocol
    class NotificationMessage < Message
      lsp_attribute :method, String
      lsp_attribute :params, Object, optional: true
    end
  end
end
