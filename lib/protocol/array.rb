# frozen_string_literal: true

module Protocol
  class Array < ::Array
    attr_accessor :lsp_attrs

    def []=(accessor, value)
      super(accessor, validate(value))
    end

    def <<(value)
      super(validate(value))
    end

    def push(value)
      super(validate(value))
    end

    private

    def validate(value)
      own_types = lsp_attrs[:types]
      local_value = try_protocol_item(value)
      raise StandardError, "ARR '#{local_value}' '#{value}' is not a #{Util::StringList.new(own_types).call}" unless Util::IsOneOf.new(local_value, own_types).call
      raise StandardError, "ARR '#{key}' must be one of #{lsp_attrs[:in]}" unless match_enum(local_value)
      local_value
    end

    def try_protocol_item(value)
      return value unless value.is_a? Hash

      lsp_attrs[:types].detect do |t|
        if t.respond_to?(:from_hash) && (result = t.from_hash(value))
          return result
        end
      end
    end

    def match_enum(value)
      lsp_attrs[:in].nil? || lsp_attrs[:in].include?(value)
    end
  end
end
