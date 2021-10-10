# frozen_string_literal: true

module ADT
  module BinaryTree
    # A node of a binary tree. Contains a reference to its parent and two its left and right subtree.
    class Node
      attr_accessor :data
      attr_reader :left, :right, :parent

      def initialize(data)
        @data = data
        @left = nil
        @right = nil
        @parent = nil
      end

      def insert_left(node)
        return if node.nil?

        @left = node
        @left.parent = self
      end

      def insert_right(node)
        return if node.nil?

        @right = node
        @right.parent = self
      end

      def height
        left_height = 0
        right_height = 0
        left_height = @left.height + 1 unless @left.nil?
        right_height = @right.height + 1 unless @right.nil?
        [left_height, right_height].max
      end

      def size
        left_size = 0
        right_size = 0
        left_size = @left.size unless @left.nil?
        right_size = @right.size unless @right.nil?
        left_size + right_size + 1
      end

      def to_in_order_a
        array = []
        array.concat @left.to_in_order_a unless @left.nil?
        array.append @data
        array.concat @right.to_in_order_a unless @right.nil?
        array
      end

      def in_order_nodes
        array = []
        array.concat @left.in_order_nodes unless @left.nil?
        array.append self
        array.concat @right.in_order_nodes unless @right.nil?
        array
      end

      protected

      attr_writer :parent
    end
  end
end
