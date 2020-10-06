module ADT
  module Tree
    class TreeNode
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
        a = []
        a.concat @left.to_in_order_a unless @left.nil?
        a.append @data
        a.concat @right.to_in_order_a unless @right.nil?
        a
      end
    end
  end
end