require 'adt/hash_graph'

module ADT
  class HashGraph

    # Q4.1 a) Route Between Nodes: Given a directed graph, design an algorithm to find out whether there is a route
    # between two nodes.
    def route_bfs?(source_key, target_key)
      return false unless @vertices.has_key?(source_key) && @vertices.has_key?(target_key)
      visited = Set.new
      queue = []
      visited.add(source_key)
      queue.push(@vertices[source_key])
      until queue.empty?
        vertex = queue.shift
        vertex.adjacent.each do |adj_key|
          return true if adj_key == target_key
          unless visited.include?(adj_key)
            visited.add(adj_key)
            queue.push(@vertices[adj_key])
          end
        end
      end
      false
    end

    # Q4.1 b) Route Between Nodes: Given a directed graph, design an algorithm to find out whether there is a route
    # between two nodes.
    def route_dfs?(source_key, target_key)
      return false unless @vertices.has_key?(source_key) && @vertices.has_key?(target_key)
      visited = Set.new
      aux_route_dfs?(source_key, target_key, visited)
    end

    # Q4.7) You are given a list of products and a list of dependencies  (which is a list of pairs of projects, where
    # the second project is dependent on the first project). All of a project's dependencies must be built before the
    # project is. Find a build order that will allow the projects to be built. If there is no valid build order, return
    # an empty array.
    def build_order
      throw NotImplementedError
    end

    private

    def aux_route_dfs?(source_key, target_key, visited)
      visited.add(source_key)
      @vertices[source_key].adjacent.each do |adj_key|
        return true if adj_key == target_key
        return aux_route_dfs?(adj_key, target_key, visited) unless visited.include?(adj_key)
      end
      false
    end
  end
end
