# frozen_string_literal: true

module Protocol
  module Util
    class JSON
      def initialize(object)
        @object = object
      end

      def call
        case @object
        when String, Symbol then %("#{@object}")
        when Hash   then "{#{@object.map { |key, sub_val| kv_output(key, sub_val) }.compact.join(',')}}"
        when Array  then "[#{@object.map { |sub_val| Util::JSON.new(sub_val).call }.compact.join(',')}]"
        else @object.to_s
        end
      end

      private

      def kv_output(key, val)
        %("#{key}":#{Util::JSON.new(val).call}) unless val.nil?
      end
    end
  end
end
