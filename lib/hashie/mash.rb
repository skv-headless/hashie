module Hashie
  class Mash
    def initialize
      @hash = {}
    end

    def method_missing(method, *args, &block)
      if method.to_s.chars.last  == "?"
        method = method.to_s.gsub("?", "").to_sym
        @hash.has_key? method
      elsif method.to_s.chars.last  == "="
        method = method.to_s.gsub("=", "").to_sym
        @hash[method] = args.first
      elsif method.to_s.chars.last  == "!"
        method = method.to_s.gsub("!", "").to_sym
        @hash[method] = Mash.new
      else
        @hash[method]
      end
    end
  end
end
