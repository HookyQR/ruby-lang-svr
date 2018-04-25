# frozen-string-literal: true

require_relative 'message'

module Protocol
  class RequestMessage < Message
    lsp_attribute :id, [String, Integer]
    lsp_attribute :method, String
    lsp_attribute :params, Object, optional: true
  end
end
