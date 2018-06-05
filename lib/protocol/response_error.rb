# frozen_string_literal: true

require_relative 'error_codes'

module LangSvr
  module Protocol
    class ResponseError < Base
      lsp_attribute :code, Integer, in: ErrorCodes.valid_codes
      lsp_attribute :message, String
      lsp_attribute :data, Object, optional: true
    end
  end
end
