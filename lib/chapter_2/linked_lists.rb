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

      # Q2.6) Palindrome: Implement a function to check if a linked list is a palindrome.
      def palindrome?
        stack = []
        middle = @size / 2
        even = @size % 2 == 0
        each_with_index do |value, index|
          if index < middle
            stack.push value
          elsif index > middle || (index == middle && even)
            return false if stack.pop != value
          end
        end
        true
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
      return ADT::List::SLList.new if list1.empty? && list2.empty?
      return ADT::List::SLList.create_from_array(list1) if list2.empty?
      return ADT::List::SLList.create_from_array(list2) if list1.empty?
      bigger, smaller = list1.size < list2.size ? [list2, list1] : [list1, list2]
      sum = ADT::List::SLList.new
      carry = 0
      s_n = smaller.head
      bigger.each do |value|
        if s_n.nil?
          partial_sum = value + carry
          sum.add(partial_sum % 10)
          carry = partial_sum / 10
        else
          partial_sum = value + s_n.data + carry
          sum.add(partial_sum % 10)
          carry = partial_sum / 10
          s_n = s_n.next
        end
      end
      if carry != 0
        sum.add(carry)
      end
      sum
    end

    # Q2.5 b) Sum Lists: You have two numbers represented by linked lists, where each node contains a single digit. The
    # digit. The digits are stored in +forward+ order, such that the 1's digit are at the end fo each list. Write a
    # function that adds the two numbers and returns the sum as a linked list.
    def self.sum_lists_f(list1, list2)
      return ADT::List::SLList.new if list1.empty? && list2.empty?
      return ADT::List::SLList.create_from_array(list1) if list2.empty?
      return ADT::List::SLList.create_from_array(list2) if list1.empty?
      bigger, smaller = list1.size < list2.size ? [list2, list1] : [list1, list2]
      sum = ADT::List::SLList.new
      while bigger.size > smaller.size
        smaller.add_to_head(0)
      end
      carry = sum_nodes_f(sum, bigger.head, smaller.head)
      if carry > 0
        sum.add_to_head(carry)
      end
      sum
    end

    # Q2.7) Intersection: Given two (singly) linked lists, determine if the two lists intersect. Return the intersecting
    #  node. Note that the node intersection is defined based on reference, not value. That is, if the kth node of the
    #  first linked list is the exact same node (by reference) as the jth node of the second linked list, then they are
    #  intersecting.
    def self.intersect?(list1, list2)
      bigger, smaller = list1.size < list2.size ? [list2, list1] : [list1, list2]
      diff = bigger.size - smaller.size
      n2 = list2.head
      list1.each_node do|n1|
        if diff == 0
          return n1 if n1 == n2
          n2 = n2.next
        else
          diff -= 1
        end
      end
    end

    private

    def self.sum_nodes_f(sum, node1, node2)
      if node1.next.nil? && node2.next.nil?
        partial_sum = node1.data + node2.data
      else
        partial_sum = node1.data + node2.data + sum_nodes_f(sum, node1.next, node2.next)
      end
      sum.add_to_head(partial_sum % 10)
      partial_sum / 10
    end
  end
end