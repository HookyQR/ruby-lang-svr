# frozen-string-literal: true

require_relative 'message'
require_relative 'response_error'

module Protocol
  class ResponseMessage < Message
    lsp_attribute :id, String, Integer, NilClass
    lsp_attribute :result, Object, optional: true
    lsp_attribute :error, ResponseError, optional: true
  end
end
