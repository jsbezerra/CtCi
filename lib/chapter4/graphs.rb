require 'adt/hash_graph'

module ADT

  class HashGraph

    # Q4.1) Route Between Nodes: Given a directed graph, design an algorithm to find out whether there is a route
    # between two nodes.
    def route?(source_key, target_key)
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
  end
end
