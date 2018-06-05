# frozen_string_literal: true

require_relative 'base'

module Protocol
  class SaveOptions < Base
    lsp_attribute :includeText, TrueClass, FalseClass, optional: true
  end
end
