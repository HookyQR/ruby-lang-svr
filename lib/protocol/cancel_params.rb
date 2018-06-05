# frozen_string_literal: true

require_relative 'base'

module LangSvr
  module Protocol
    class CancelParams < Base
      lsp_attribute :id, Integer, String
    end
  end
end
