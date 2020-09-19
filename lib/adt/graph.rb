module ADT
  class Graph
    attr_reader :vertices

    def initialize
      @vertices = []
    end

    def add_node(node)
      @vertices << node
    end

    def unvisit
      @vertices.each { |vertex| vertex.visited = false }
    end

    def dfs(root)
      return if root.nil?
      root.visited = true
      if block_given?
        yield root
      end
      root.adjacent.each { |vertex|
        dfs(vertex) unless vertex.visited
      }
    end

    def bfs(root)
      queue = []
      root.visited = true
      queue.push root

      until queue.empty?
        vertex = queue.shift
        if block_given?
          yield vertex
        end
        vertex.adjacent.each { |adj|
          unless adj.visited
            adj.visited = true
            queue.push adj
          end
        }
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