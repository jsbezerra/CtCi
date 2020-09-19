module ADT
  class Graph
    attr_reader :vertices

    def initialize
      @vertices = []
    end

    def add_node(node)
      @vertices << node
    end

    def dfs(root)
      return if root.nil?
      root.visited = true
      if block_given?
        yield(root)
      end
      root.adjacent.each do |node|
        dfs(node) unless node.visited
      end
    end
  end

  class Node
    attr_reader :adjacent
    attr_reader :vertex
    attr_accessor :visited

    def initialize(vertex)
      @vertex = vertex
      @adjacent = []
      @visited = false
    end

    def add_adjacent(node)
      @adjacent << node
    end
  end
end