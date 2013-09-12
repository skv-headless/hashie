module Hashie
  class Clash
    include SplitMethodName

    def initialize
      @hash = {}
    end

    def to_hash
      @hash
    end

    def method_missing(method, *args, &block)
      if last_char?(method, '!')
        method_name = pure_method_name(method)
        @hash[method_name] = args.first
      else
        @hash[method] = args.first
      end

      self
    end
  end
end
