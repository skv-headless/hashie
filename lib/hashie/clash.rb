module Hashie
  class Clash
    def initialize
      @hash = {}
    end

    def to_hash
      @hash
    end

    def method_missing(method, *args, &block)
      @hash[method] = args.first
      self
    end
  end
end
