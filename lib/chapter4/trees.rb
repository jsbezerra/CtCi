require 'adt/tree'
require 'adt/list'

module ADT
  module Tree
    class TreeNode

      # Q4.2) Minimal Tree: Given a sorted (increasing order) array with unique integer elements, write an algorithm
      # to create a binary search tree with minimal height.
      def self.create_minimal_bts(values)
        self.minimal_bts(values, 0, values.size - 1)
      end

      # Q4.3) List of Depths: Given a binary tree, design an algorithm which creates a linked list of all the nodes at
      # each depth (e.g., if you have a tree with depth D, you'll have D linked lists).
      def list_of_depths
        current_level = [self]
        lists = []
        loop do
          list = ADT::List::SLList.new
          next_level = []

          current_level.each do |node|
            list.add(node.data)

            unless node.left.nil?
              next_level << node.left
            end

            unless node.right.nil?
              next_level << node.right
            end
          end

          lists << list
          current_level = next_level
          break if next_level.empty?
        end
        lists
      end

      # Q4.4) Check Balanced: Implement a function to test if a binary tree is balanced. For the purposes of this
      # question, a balanced tree is defined to be a tree such that the heights of the two subtrees of any node never
      # differ by more than one.
      def check_balanced?
        throw NotImplementedError
      end

      private

      def self.minimal_bts(values, start, final)
        return if final < start
        mid = (start + final) / 2
        root = ADT::Tree::TreeNode.new(values[mid])
        root.insert_left(minimal_bts(values, start, mid - 1))
        root.insert_right(minimal_bts(values, mid + 1, final))
        root
      end
    end
  end
end