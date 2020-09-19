module ADT
  module List
    class SLNode
      attr_reader :data
      attr_reader :next

      def initialize(data)
        @data = data
      end

      def append(data)
        node = SLNode.new(data)
        n = self
        until n.next.nil?
          n = n.next
        end
        n.next = node
      end

      protected

      attr_writer :next
    end

    class SLList
      include Enumerable

      attr_reader :head
      attr_reader :size

      def initialize
        @size = 0
      end

      def add(data)
        if @head.nil?
          @head = SLNode.new data
        else
          @head.append(data)
        end
        @size += 1
      end

      def each
        n = @head
        until n.nil?
          yield n
          n = n.next
        end
      end
    end
  end
end
