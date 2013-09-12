module Hashie

  class Mash
    include SplitMethodName

    def initialize
      @hash = {}
    end

    def method_missing(method, *args, &block)
      method_name  = pure_method_name(method)

      methods = {
        '?' => lambda { @hash.has_key? method_name },
        '=' => lambda { @hash[method_name] = args.first },
        '!' => lambda { @hash[method_name] = Mash.new },
        '_' => lambda do
          if self.call(method_name).nil?
            Mash.new
          else
            self.call(method_name)
          end
        end
      }

      if methods.has_key? last_char(method)
        methods[last_char(method)].call
      else
        @hash[method_name]
      end
    end
  end
end
