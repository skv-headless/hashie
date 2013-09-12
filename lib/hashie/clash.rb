module Hashie
  class Dash
    class << self
      attr_reader :defaults, :requireds, :properties
    end

    def self.property(property_name, options = {})
      @defaults ||= {}
      @requireds ||= []
      @properties ||= {}

      if options.has_key? :default
        @defaults[property_name] = options[:default]
      end

      if options.has_key? :required
        @requireds << property_name
      end

      @properties[property_name] = nil

      define_method("#{property_name}=") do |value|
        self[property_name] = value
      end

      define_method("#{property_name}") do
        self[property_name]
      end
    end

    def initialize(properties = {})
      @inst_defaults = self.class.defaults.dup
      @inst_requireds = self.class.requireds.dup
      @inst_properties = self.class.properties.dup

      if (@inst_requireds - properties.keys).any?
        raise ArgumentError, "The properties are not defined"
      end

      @inst_properties.keys.each do |key|
        @inst_properties[key] = properties[key]
      end
    end

    def [](key)
      @inst_properties[key] || raise(NoMethodError)
    end

    def []=(key, value)
      @inst_properties[key] = value
    end
  end
end
