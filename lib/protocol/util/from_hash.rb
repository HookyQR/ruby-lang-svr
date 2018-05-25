# frozen_string_literal: true

module Protocol
  module Util
    class FromHash
      def initialize(hash, klass)
        @hash = hash
        @klass = klass
      end

      def call
        @klass.new(@hash) if match_constants && match_keys
      end

      private

      def match_constants
        @klass.constants.all? do |constant|
          @hash[const_to_key(constant)] == @klass.const_get(constant)
        end
      end

      def match_keys
        @hash.keys.all? { |key| @klass.public_instance_methods.include? key }
      end

      def const_to_key(constant)
        constant.to_s.gsub(/(?<!_)[A-Z]/, &:downcase).gsub(/_([A-Z])/, '\1').to_sym
      end
    end
  end
end
