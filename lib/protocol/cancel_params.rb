# frozen_string_literal: true

module Protocol
  class CancelParams < Base
    lsp_attribute :id, [Integer, String]
  end
end
