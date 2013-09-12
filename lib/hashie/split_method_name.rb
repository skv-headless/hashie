module Hashie
  module SplitMethodName
    def last_char(method)
       method.to_s.chars.last
    end

    def last_char?(method, char)
      last_char(method) == char
    end

    def pure_method_name(method)
       method.to_s.chomp("!").chomp("_").chomp("=").chomp("?").to_sym
    end
  end
end