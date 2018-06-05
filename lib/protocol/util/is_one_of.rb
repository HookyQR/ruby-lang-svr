# frozen_string_literal: true

module Protocol
  module Util
    class IsOneOf
      def initialize(value, candidates)
        @value = value
        @candidates = candidates
      end

      def call
        @candidates&.any? { |type| @value.is_a? type }
      end
    end
  end
end
