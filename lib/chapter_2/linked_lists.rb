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
      # (Without using an additional data structure).
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

      # Q2.4) Partition: Write code to partition a linked list around a value +x+, such that all nodes less than +x+
      # come before all nodes greater than or equal to +x+. If +x+ is contained within the list, the values of +x+ only
      # need to be after the elements less than +x+. The partition element +x+ can appear anywhere in the "right"
      # partition; it does not need to appear between the left and right partitions.
      def partition!(x)
        less = ADT::List::SLList.new
        more = ADT::List::SLList.new
        self.each do |data|
          if data < x
            less.add(data)
          else
            more.add(data)
          end
        end
        less.merge!(more)
        @head = less.head
      end
    end
  end
end

module Chapter2
  module LinkedLists

    # Q2.5 a) Sum Lists: You have two numbers represented by linked lists, where each node contains a single digit. The
    # digit. The digits are stored in +reverse+ order, such that the 1's digit are at the head fo each list. Write a
    # function that adds the two numbers and returns the sum as a linked list.
    def self.sum_lists_r(list1, list2)
      throw NotImplementedError
    end

    # Q2.5 b) Sum Lists: You have two numbers represented by linked lists, where each node contains a single digit. The
    # digit. The digits are stored in +forward+ order, such that the 1's digit are at the end fo each list. Write a
    # function that adds the two numbers and returns the sum as a linked list.
    def self.sum_lists_f(list1, list2)
      throw NotImplementedError
    end
  end
end