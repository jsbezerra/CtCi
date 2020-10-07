module ADT
  class Stack

    include Enumerable

    def initialize
      @top = nil
    end

    def push(data)
      node = Node.new(data)
      node.next = @top
      @top = node
    end

    def pop
      return if empty?
      data = @top.data
      @top = @top.next
      data
    end

    def peek
      return if empty?
      @top.data
    end

    def empty?
      @top.nil?
    end

    def each
      n = @top
      until n.nil?
        yield n.data
        n = n.next
      end
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