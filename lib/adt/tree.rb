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

      def arr
        a = []
        a.concat @left.arr unless @left.nil?
        a.append @data
        a.concat @right.arr unless @right.nil?
        a
      end
    end
  end
end