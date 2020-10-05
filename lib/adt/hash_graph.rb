require 'set'

module ADT
  # A directed graph that allows no duplicated nodes nor edges
  class HashGraph
    attr_reader :vertices

    def initialize
      @vertices = Hash.new
    end

    def add_node(key)
      throw ArgumentError.new("graph already has a node with key #{key}") if @vertices.has_key? key
      node = Node.new(key)
      @vertices[key] = node
    end

    def create_edge(source_key, target_key)
      throw ArgumentError.new("graph does not have a node with key #{source_key}") unless @vertices.has_key? source_key
      throw ArgumentError.new("graph does not have a node with key #{target_key}") unless @vertices.has_key? target_key
      @vertices[source_key].add_adjacent(target_key)
    end

    def dfs(root)
      return if root.nil?
      visited = Set.new
      visited.add(root)
      if block_given?
        yield root
      end
      root.adjacent.each { |vertex|
        dfs(vertex) unless visited.include? vertex
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

  private

  class Node
    attr_reader :adjacent
    attr_reader :vertex
    attr_accessor :visited

    def initialize(vertex)
      @vertex = vertex
      @adjacent = Set.new
      @visited = false
    end

    def add_adjacent(key)
      @adjacent.add(key)
    end
  end
end