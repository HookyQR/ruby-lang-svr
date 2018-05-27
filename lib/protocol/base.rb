# frozen-string-literal: true

require_relative 'util'
require_relative 'array'

module Protocol
  class NULL
    def to_s
      'null'
    end
  end

  class Base
    def initialize(**args)
      args.each do |key, val|
        setter = "#{key}="
        send(setter, val) if respond_to?(setter)
      end
    end

    def self.lsp_attribute(key, type_or_val, **opts)
      @lsp_attrs ||= {}
      @lsp_attrs[key] = opts.dup

      case type_or_val
      when ::Array then lsp_attribute_type_setter(key, type_or_val)
      when ::Class then lsp_attribute_type_setter(key, [type_or_val])
      else            return lsp_const(key, type_or_val)
      end

      lsp_attribute_getter(key)
    end

    def to_s
      Util::JSON.new(self.class.lsp_attrs.map { |key, _opts| [key, send(key)] }.to_h).call
    end

    private

    def store(key, value)
      instance_variable_set("@#{key}", value)
    end

    class << self
      def lsp_attrs
        parent = ancestors[1]
        {}.merge(parent.respond_to?(:lsp_attrs) ? parent.lsp_attrs : {})
          .merge(@lsp_attrs || {})
      end

      def rectify(key, value)
        if lsp_attrs[key][:array]
          raise StandardError, "BASE RECT '#{value}' is not an Array" unless value.is_a? ::Array
          Protocol::Array.new.tap do |array|
            array.lsp_attrs = lsp_attrs[key]
            value.each { |v| array << v }
          end
        else
          value.nil? ? nulify(key) : validate(key, value)
        end
      end

      def from_hash(hash)
        Util::FromHash.new(hash, self).call
      end

      private

      def lsp_const(key, value)
        define_method("#{key}=") { value } if methods.include?("#{key}=")

        v = value.nil? ? NULL.new : value
        define_method(key) { v }

        const_name = key.to_s.gsub(/[A-Z]/) { |u| "_#{u}" }.upcase

        # remove_const(const_name) if const_defined? const_name
        const_set(const_name, v)
      end

      def lsp_attribute_type_setter(key, types)
        raise StandardError, 'attribute types must have at least one value' if types.empty?
        raise StandardError, 'attribute types must all be classes' unless types.all? { |t| t.is_a? Class }

        @lsp_attrs[key][:types] = types
        define_method("#{key}=") { |value| store(key, self.class.rectify(key, value)) }
      end

      def lsp_attribute_getter(key)
        own_attrs = lsp_attrs[key]
        define_method(key) do
          if own_attrs[:array] && !instance_variable_defined?("@#{key}")
            Array.new.tap do |array|
              array.lsp_attrs = own_attrs
              instance_variable_set("@#{key}", array)
            end
          end
          return instance_variable_get("@#{key}") if instance_variable_defined? "@#{key}"
          raise StandardError, "Non-optional attribute #{key} is not set in #{self.class}" unless own_attrs[:optional]
        end
      end

      def try_protocol_item(types, value)
        return value unless value.is_a? Hash

        types.detect do |t|
          if t.respond_to?(:from_hash) && (result = t.from_hash(value))
            return result
          end
        end

        value
      end

      def nulify(key)
        return NULL.new if lsp_attrs[key][:types].include?(NilClass) || lsp_attrs[key][:in]&.include?(nil)
        return nil if lsp_attrs[key][:optional]
        raise StandardError, "#{key} not optional, and can not be nil"
      end

      def validate(key, value)
        own_attrs = lsp_attrs[key]
        own_types = lsp_attrs[key][:types]
        local_value = try_protocol_item(own_types, value)
        raise StandardError, "BASE V '#{local_value}' is not a #{Util::StringList.new(own_types).call}" unless Util::IsOneOf.new(local_value, own_types).call
        raise StandardError, "BASE V '#{key}' must be one of #{own_attrs[:in]}" unless match_enum(local_value, own_attrs)
        local_value
      end

      def match_enum(value, attrs)
        attrs[:in].nil? || attrs[:in].include?(value)
      end
    end
  end
end
