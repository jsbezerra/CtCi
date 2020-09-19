module Chapter4

  class Node
    attr_accessor :data
    attr_reader :left
    attr_reader :right

    def initialize(data)
      @data = data
    end

    def insert_left(node)
      @left = node
    end

    def insert_right(node)
      @right = node
    end
  end
end