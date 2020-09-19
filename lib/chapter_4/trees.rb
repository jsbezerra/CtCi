require 'adt/binary_search_tree'

module Chapter4
  module Trees

    # Q4.1) Minimal Tree: Given a sorted (increasing order) array with unique integer elements, write an algorithm
    # to create a binary search tree with minimal height.
    def self.create_minimal_bts(values)
      self.minimal_bts(values, 0, values.size - 1)
    end

    private

    def self.minimal_bts(values, start, final)
      return nil if final < start
      mid = (start + final) / 2
      root = ADT::TreeNode.new(values[mid])
      root.insert_left(minimal_bts(values, 0, mid - 1))
      root.insert_right(minimal_bts(values, mid + 1, final))
      return root
    end
  end
end