module ADT
  class Stack

    def initialize
      @top = nil
    end

    def push(data)
      node = Node.new(data)
      node.next = @top
      @top = node
    end

    def pop
      return nil if empty?
      data = @top.data
      @top = @top.next
      data
    end

    def peek
      return nil if empty?
      @top.data
    end

    def empty?
      @top.nil?
    end

    private

    class Node
      attr_accessor :data
      attr_accessor :next

      def initialize(data)
        @data = data
      end
    end
  end
end