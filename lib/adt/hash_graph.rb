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
      @vertices[target_key].increase_degree
    end
  end

  private

  class Node
    attr_reader :adjacent
    attr_reader :vertex
    attr_reader :degree

    def initialize(vertex)
      @vertex = vertex
      @adjacent = Set.new
      @degree = 0
    end

    def add_adjacent(key)
      @adjacent.add(key)
    end

    def increase_degree
      @degree += 1
    end
  end
end