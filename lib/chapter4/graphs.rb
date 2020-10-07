require 'adt/hash_graph'
require 'adt/stack'

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
    def build_order!
      vertices_size = @vertices.size
      order = []
      current_batch = @vertices.filter_map { |_, node| node if node.degree == 0 }
      until current_batch.empty?
        next_batch = []
        current_batch.each do |node|
          children = node.adjacent
          children.inject(next_batch) do |batch, child|
            batch << @vertices[child] if @vertices[child].degree - 1 == 0
            batch
          end
          order << node.key
          delete_node(node.key)
        end
        current_batch = next_batch
      end
      order.size == vertices_size ? order : []
    end

    # Q4.7) You are given a list of products and a list of dependencies  (which is a list of pairs of projects, where
    # the second project is dependent on the first project). All of a project's dependencies must be built before the
    # project is. Find a build order that will allow the projects to be built. If there is no valid build order, return
    # an empty array.
    # (This algorithm uses DFS)
    def build_order_dfs
      status = Hash.new
      stack = ADT::Stack.new
      @vertices.each_key do |key|
        status[key] = :blank
      end
      @vertices.each do |key, node|
        if status[key] == :blank
          return [] unless do_dfs(node, stack, status)
        end
      end
      stack.to_a
    end

    def do_dfs(node, stack, status)
      if status[node.key] == :partial
        return false # cycle found
      end

      if status[node.key] == :blank
        status[node.key] = :partial
        node.adjacent.each do |adj_key|
          return false unless do_dfs(@vertices[adj_key], stack, status)
        end
        status[node.key] = :complete
        stack.push(node.value)
      end
      true
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
