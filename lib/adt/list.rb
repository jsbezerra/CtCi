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

      def delete(data)
        return if @head.nil?
        @head.delete(data)
        @size -= 1
      end

      def each
        n = @head
        until n.nil?
          yield n.data
          n = n.next
        end
      end

      #######################################################
      # Questions resolutions are placed below this section #
      #######################################################

      # Q2.1 a) Remove Dups: Write code to remove duplicates from an unsorted linked list.
      def remove_dups!
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

      # Q2.1 b) Remove Dups: Write code to remove duplicates from an unsorted linked list.
      # (Without using an adicional data structure).
      def remove_dups_b!
        return if @head.nil?
        seed = @head
        until seed.nil?
          data = seed.data
          previous = seed
          current = seed.next
          until current.nil?
            if current.data == data
              previous.next = current.next
              @size -= 1
            else
              previous = current
            end
            current = current.next
          end
          seed = seed.next
        end
      end

      # Q2.2) Return Kth to Last: Implement an algorithm to return the kth to last element of a singly linked list.
      def return_kth_to_last(k)
        return if k > @size
        node = @head
        while k != @size
          node = node.next
          k += 1
        end
        node.data
      end
    end
  end
end
