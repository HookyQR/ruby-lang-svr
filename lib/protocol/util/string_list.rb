# frozen_string_literal: true

module Protocol
  module Util
    class StringList
      def initialize(values)
        @values = values
      end

      def call
        case @values.length
        when 0 then ''
        when 1 then @values[0].to_s
        else        [@values[0...-1].join(', '), @values[-1]].join(' or ')
        end
      end
    end
  end
end
