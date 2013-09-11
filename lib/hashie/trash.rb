module Hashie
  class Trash
    class << self
      attr_reader :translations, :transform_value
    end

    def self.property(property_name, options = {})
      @translations ||= {}
      @transform_value ||= {}

      if options.has_key? :from
        @translations[options[:from]] = property_name
      end

      if options.has_key? :transform_with
        @transform_value[property_name] = options[:transform_with]
      end

      define_method("#{property_name}=") do |value|
        self[property_name] = value
      end

      define_method("#{property_name}") do
        self[property_name]
      end
    end

    def initialize(properties = {})
      self.class.translations.each_pair do |key, value|
        if properties.has_key? key
          properties[value] = properties[key]
          properties.delete key
        end
      end

      self.class.transform_value.each_pair do |key, value|
        properties[key] = value.call(properties[key])
      end

      @inst_properties = properties
    end

    def []=(key, value)
      if self.class.transform_value.has_key?(key)
        value = self.class.transform_value[key].call(value)
      end

      @inst_properties[key] = value
    end

    def [](key)
      @inst_properties[key]
    end
  end
end