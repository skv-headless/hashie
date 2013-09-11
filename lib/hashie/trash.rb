module Hashie
  class Trash
    class << self
      attr_reader :translations
    end

    def self.property(property_name, options = {})
      @translations ||= {}

      if options.has_key? :from
        @translations[options[:from]] = property_name
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
      @inst_properties = properties
    end

    def []=(key, value)
      @inst_properties[key] = value
    end

    def [](key)
      @inst_properties[key]
    end
  end
end