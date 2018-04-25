# frozen_string_literal: true

require_relative 'range'

module Protocol
  class Location < Base
    lsp_attribute :uri, String
    lsp_attribute :range, Range
  end
end
