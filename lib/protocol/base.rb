# frozen-string-literal: true

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
        send(setter, val) if respond_to?("#{key}=")
      end
    end

    def self.lsp_attribute(key, type_or_val, **opts)
      @lsp_attrs ||= {}
      @lsp_attrs[key] = opts.dup

      case type_or_val
      when Array then lsp_attribute_type_setter(key, type_or_val)
      when Class then lsp_attribute_type_setter(key, [type_or_val])
      else            return lsp_const(key, type_or_val)
      end

      lsp_attribute_getter(key)
    end

    def self.lsp_attrs
      parent = ancestors[1]
      {}.merge(parent.respond_to?(:lsp_attrs) ? parent.lsp_attrs : {})
        .merge(@lsp_attrs || {})
    end

    def to_s
      "{#{lsp_kv_strings.compact.join(',')}}"
    end

    def self.rectify(key, value)
      value.nil? ? nulify(key) : validate(key, value)
    end

    private

    private_class_method def self.lsp_const(key, value)
      define_method("#{key}=") { value } if methods.include?("#{key}=")

      if value.nil?
        v = NULL.new
        define_method(key) { v }
      else
        define_method(key) { value }
      end
    end

    private_class_method def self.lsp_attribute_type_setter(key, types)
      raise StandardError, 'attribute types must have at least one value' if types.empty?
      raise StandardError, 'attribute types array must all be classes' unless types.all? { |t| t.is_a? Class }

      @lsp_attrs[key][:types] = types
      define_method("#{key}=") { |value| store(key, self.class.rectify(key, value)) }
    end

    private_class_method def self.lsp_attribute_getter(key)
      own_attrs = @lsp_attrs[key]
      define_method(key) do
        return instance_variable_get("@#{key}") if instance_variable_defined? "@#{key}"
        raise StandardError, "Non-optional attribute #{key} is not set" unless own_attrs[:optional]
      end
    end

    private_class_method def self.nulify(key)
      return NULL.new if @lsp_attrs[key][:types].include?(NilClass) || @lsp_attrs[key][:in]&.include?(nil)
      return nil if @lsp_attrs[key][:optional]
      raise StandardError, "#{key} not optional, and can not be nil"
    end

    private_class_method def self.validate(key, value)
      own_attrs = @lsp_attrs[key]
      raise StandardError, "#{value} is not a #{string_list(own_attrs[:types])}" unless own_attrs[:types].any? { |t| value.is_a? t }
      raise StandardError, "#{key} must be one of [#{own_attrs[:in]}]" if own_attrs[:in] && !own_attrs[:in].include?(value)
      value
    end

    def store(key, value)
      value.nil? ? remove_instance_variable("@#{key}") : instance_variable_set("@#{key}", value)
    end

    def lsp_kv_strings
      self.class.lsp_attrs.map do |key, _opts|
        val = send(key)
        "#{key}:#{output_for(val)}" unless val.nil?
      end
    end

    def output_for(val)
      val.is_a?(String) ? "\"#{val}\"" : val.to_s
    end

    private_class_method def self.string_list(values)
      case values.length
      when 0 then ''
      when 1 then values[0].to_s
      else        [values[0...-1].join(', '), values[-1]].join(' or ')
      end
    end
  end
end
