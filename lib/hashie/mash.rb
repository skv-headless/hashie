module Hashie
  include SplitMethodName
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
      elsif method.to_s.chars.last  == "_"
        method = method.to_s.gsub("_", "") + '!'
        if self.call(method.to_sym).nil?
          Mash.new
        else
          self.call(method.to_sym)
        end
      else
        @hash[method]
      end
    end
  end
end
