module ADT
  module BinaryTree
    class Node
      attr_accessor :data
      attr_reader :left
      attr_reader :right

      def initialize(data)
        @data = data
        @left = nil
        @right = nil
      end

      def insert_left(node)
        @left = node
      end

      def insert_right(node)
        @right = node
      end

      def height
        left_height = 0
        right_height = 0
        unless @left.nil?
          left_height = @left.height + 1
        end
        unless @right.nil?
          right_height = @right.height + 1
        end
        [left_height, right_height].max
      end

      def to_in_order_a
        array = []
        array.concat @left.to_in_order_a unless @left.nil?
        array.append @data
        array.concat @right.to_in_order_a unless @right.nil?
        array
      end
    end
  end
end