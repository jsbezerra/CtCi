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

      def self.create_from_array(array)
        list = self.new
        array.each do |data|
          list.add(data)
        end
        return list
      end

      def add(data)
        if !defined? @head
          @head = SLNode.new data
        else
          @head.append(data)
        end
        @size += 1
      end

      def add_to_head(data)
        node = SLNode.new data
        if !defined? @head
          @head = node
        else
          node.next = @head
          @head = node
        end
        @size += 1
      end

      # substitutes the head of a list with a given node
      def new_head!(node)
        @head = node
        @size = 0
        until node.nil?
          @size += 1
          node = node.next
        end
      end

      def delete(data)
        return if @head.nil?
        @head.delete(data)
        @size -= 1
      end

      def empty?
        !defined? @head
      end

      def merge!(list)
        return if list.empty?
        if empty?
          @head = list.head
          @size = list.size
        else
          n = @head
          until n.next.nil?
            n = n.next
          end
          n.next = list.head
          @size += list.size
        end
      end

      def each
        n = @head
        until n.nil?
          yield n.data
          n = n.next
        end
      end

      def each_node
        n = @head
        until n.nil?
          yield n
          n = n.next
        end
      end

      def get_nodes
        n = @head
        nodes = []
        until n.nil?
          nodes << n
          n = n.next
        end
        nodes
      end
    end
  end
end
