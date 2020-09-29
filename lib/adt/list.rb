module ADT
  module List
    class SLNode
      attr_reader :data
      attr_accessor :next

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

      def delete(data)
        n = self
        until n.next.nil?
          if n.next.data == data
            n.next = n.next.next
            return
          end
          n = n.next
        end
      end
    end

    class SLList
      include Enumerable

      attr_reader :head
      attr_reader :size

      def initialize
        @size = 0
      end

      def add(data)
        if !defined? @head
          @head = SLNode.new data
        else
          @head.append(data)
        end
        @size += 1
      end

      def delete(data)
        return if @head.nil?
        @head.delete(data)
        @size -= 1
      end

      def remove_dups
        return if @head.nil?
        found = Hash.new
        found[@head.data] = true
        previous = @head
        current = @head.next
        until current.nil?
          if found.has_key? current.data
            previous.next = current.next
            @size -= 1
          else
            found[current.data] = true
            previous = current
          end
          current = current.next
        end
      end

      def each
        n = @head
        until n.nil?
          yield n
          n = n.next
        end
      end

      def to_a
        return [] if @head.nil?
        self.inject([]) do |arr, node|
          arr << node.data
        end
      end
    end
  end
end
