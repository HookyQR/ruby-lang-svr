# frozen_string_literal: true

require_relative 'base'

module Protocol
  class CancelParams < Base
    lsp_attribute :id, Integer, String
  end
end
