require 'adt/binary_tree'
require 'adt/list'

module ADT
  module BinaryTree
    class Node

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
          list = ADT::SingleLinkedList.new
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
        compute_balance[0]
      end

      # Q4.5) Validate BST: Implement a function to check if a binary tree is a binary search tree.
      def validate_bst?(min = -Float::INFINITY, max = Float::INFINITY)
        if @left.nil?
          balanced_left = true
        else
          local_max = [@data, max].min
          return false unless @left.data.between?(min, local_max)
          balanced_left = @left.validate_bst?(min, local_max)
        end

        if @right.nil?
          balanced_right = true
        else
          local_min = [@data, min].max
          return false unless @right.data.between?(local_min, max)
          balanced_right = @right.validate_bst?(local_min, max)
        end

        balanced_left && balanced_right
      end

      # Q4.6) Successor: Write an algorithm to find the "next" node (i.e., in-order successor) of a given node in a
      # binary search tree. You may assume that each node has a link to its parent.
      def successor
        if @right.nil?
          first_left_relative
        else
          @right.leftmost_node
        end
      end

      # Q4.8) First Common Ancestor: Design an algorithm an write code to find the first common ancestor of two nodes in
      # a binary tree. Avoid storing additional nodes in a data structure. Note: This is not necessarily a binary search
      # tree.
      def first_common_ancestor(value1, value2)
        node, is_ancestor = common_ancestor(value1, value2)
        is_ancestor ? node : nil
      end

      # Q4.9) BST Sequences: A binary search tree was created by traversing through an array from left to right and
      # inserting each element. Given a binary search tree with distinct elements, return all possible arrays that could
      # have led to this tree.
      def bst_sequence
        sequences = ADT::SingleLinkedList.new

        if @left.nil? && @right.nil?
          new_sequence = ADT::SingleLinkedList.new
          new_sequence.add @data
          sequences.add new_sequence
          return sequences
        end

        left_sequences = @left.nil? ? ADT::SingleLinkedList.new : @left.bst_sequence
        right_sequences = @right.nil? ? ADT::SingleLinkedList.new : @right.bst_sequence

        left_sequences.each do |left_sequence|
          right_sequences.each do |right_sequence|
            children_sequences = ADT::SingleLinkedList.weave(left_sequence, right_sequence)
            children_sequences.each do |sequence|
              new_sequence = ADT::SingleLinkedList.new
              new_sequence.add @data
              new_sequence.merge!(sequence)
              sequences.add new_sequence
            end
          end
        end
        sequences
      end

      # Q4.10a) Check Subtree: +T1+ and +T2+ are two subtrees, with +T1+ much bigger than +T2+. Create an algorithm to
      # determine if +T2+ is a subtree of +T1+. A tree +T2+ is a subtree of +T1+ if there exists a node +n+ in +T1+ such
      # that the subtree of +n+ is identical to +T2+. That is, if you cut off the tree at node +n+, the two trees would
      # be identical
      def check_subtree?(t2)
        return true if t2.nil?
        self.pre_order_string.include? t2.pre_order_string
      end

      # Q4.10b) Check Subtree: +T1+ and +T2+ are two subtrees, with +T1+ much bigger than +T2+. Create an algorithm to
      # determine if +T2+ is a subtree of +T1+. A tree +T2+ is a subtree of +T1+ if there exists a node +n+ in +T1+ such
      # that the subtree of +n+ is identical to +T2+. That is, if you cut off the tree at node +n+, the two trees would
      # be identical
      def in_place_check_subtree?(t2)
        throw NotImplementedError
      end

      protected

      def compute_balance
        left_height, right_height = 0, 0
        unless @left.nil?
          left_balance = @left.compute_balance
          return [false, nil] unless left_balance[0]
          left_height = left_balance[1] + 1
        end
        unless @right.nil?
          right_balance = @right.compute_balance
          return [false, nil] unless right_balance[0]
          right_height = right_balance[1] + 1
        end
        balanced = (left_height - right_height).abs < 2
        height = [left_height, right_height].max
        [balanced, height]
      end

      def self.minimal_bts(values, start, final)
        return if final < start
        mid = (start + final) / 2
        root = ADT::BinaryTree::Node.new(values[mid])
        root.insert_left(minimal_bts(values, start, mid - 1))
        root.insert_right(minimal_bts(values, mid + 1, final))
        root
      end

      def leftmost_node
        node = self
        until node.left.nil?
          node = node.left
        end
        node
      end

      def first_left_relative
        node = self
        until node.parent.nil?
          return node.parent if node.parent.data > node.data
          node = node.parent
        end
      end

      def common_ancestor(value1, value2)
        return [self, true] if value1 == @data && value2 == @data

        unless @left.nil?
          left_node, is_ancestor_left = @left.common_ancestor(value1, value2)
          return [left_node, true] if is_ancestor_left
        end

        unless @right.nil?
          right_node, is_ancestor_right = @right.common_ancestor(value1, value2)
          return [right_node, true] if is_ancestor_right
        end

        return [self, true] unless left_node.nil? || right_node.nil?
        if @data == value1 || @data == value2
          is_ancestor = !left_node.nil? || !right_node.nil?
          [self, is_ancestor]
        else
          [!left_node.nil? ? left_node : right_node, false]
        end
      end

      def pre_order_string
        left_string = @left.nil? ? :nil : @left.pre_order_string
        right_string = @right.nil? ? :nil : @right.pre_order_string
        "#{@data},#{left_string},#{right_string}"
      end
    end
  end
end