require 'set'

module ADT
  # A directed graph that allows no duplicated nodes nor edges
  class HashGraph
    attr_reader :vertices

    def initialize
      @vertices = Hash.new
    end

    def add_node(key, *value)
      throw ArgumentError.new("graph already has a node with key #{key}") if @vertices.has_key? key
      node = Node.new(key, value)
      @vertices[key] = node
    end

    def delete_node(key)
      throw ArgumentError.new("can not delete node #{key} because it has incoming edges") if @vertices[key].degree > 0
      @vertices[key].adjacent.each do |adj_key|
        delete_edge(key, adj_key)
      end
      @vertices.delete(key)
    end

    def create_edge(source_key, target_key)
      throw ArgumentError.new("graph does not have a node with key #{source_key}") unless @vertices.has_key? source_key
      throw ArgumentError.new("graph does not have a node with key #{target_key}") unless @vertices.has_key? target_key
      @vertices[source_key].add_adjacent(target_key)
      @vertices[target_key].increase_degree
    end

    def delete_edge(source_key, target_key)
      throw ArgumentError.new("graph does not have a node with key #{source_key}") unless @vertices.has_key? source_key
      throw ArgumentError.new("graph does not have a node with key #{target_key}") unless @vertices.has_key? target_key
      throw ArgumentError.new("edge does not exist") unless @vertices[source_key].adjacent.include? target_key
      @vertices[target_key].decrease_degree
      @vertices[source_key].adjacent.delete(target_key)
    end
  end

  private

  class Node
    attr_reader :adjacent
    attr_reader :key
    attr_reader :degree

    def initialize(key, *value)
      @key = key
      @value = value.nil? ? key : value
      @adjacent = Set.new
      @degree = 0
    end

    def add_adjacent(key)
      @adjacent.add(key)
    end

    def increase_degree
      @degree += 1
    end

    def decrease_degree
      @degree -= 1
    end
  end
end