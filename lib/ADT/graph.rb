module ADT
  class Graph
    attr_reader :vertices

    def initialize
      @vertices = []
    end

    def add_node(node)
      @vertices << node
    end
  end

  class Node
    attr_reader :adjacent
    attr_reader :vertex

    def initialize(vertex)
      @vertex = vertex
      @adjacent = []
    end

    def add_adjacent(node)
      @adjacent << node
    end
  end
end