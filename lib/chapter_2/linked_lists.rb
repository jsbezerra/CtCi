require 'adt/list'

module ADT
  module List
    class SLNode

      # Q2.3) Delete Middle Node: Implement an algorithm to delete a node in the middle (i.e., any node but the first
      # and last node, not necessarily the exact middle) of a singly linked list, given only access to that node.
      def delete_middle_node!
        @data = @next.data
        @next = @next.next
      end
    end

    class SLList

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