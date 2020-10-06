module ADT
  module BinaryTree
    class Node
      attr_accessor :data
      attr_reader :left
      attr_reader :right
      attr_reader :parent

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
        left_height, right_height = 0, 0
        unless @left.nil?
          left_height = @left.height + 1
        end
        unless @right.nil?
          right_height = @right.height + 1
        end
        [left_height, right_height].max
      end

      def size
        left_size, right_size = 0, 0
        unless @left.nil?
          left_size = @left.size
        end
        unless @right.nil?
          right_size = @right.size
        end
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