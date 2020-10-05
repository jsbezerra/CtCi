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