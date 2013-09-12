module Hashie
  class Clash
    include SplitMethodName

    def initialize
      @hash = {}
      @current_level = nil
      @parent_nodes = []
    end

    def to_hash
      @hash
    end

    def method_missing(method, *args, &block)
      if method.to_s == '_end!'
        @current_level = @parent_nodes.pop
      elsif last_char?(method, '!')
        @parent_nodes << @current_level

        method_name = pure_method_name(method)
        current_node[method_name] = {}
        @current_level = current_node[method_name]
      else
        current_node[method] = args.first
      end

      self
    end

    def current_node
      @current_level || @hash
    end
  end
end
