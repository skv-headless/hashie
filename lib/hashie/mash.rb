module Hashie
  class Mash
    def initialize
      @hash = {}
    end

    def method_missing(method, *args, &block)
      #raise method.inspect
      if /.*\?$/.match(method)
        false
      else
        @hash[method]
      end
    end
  end
end
