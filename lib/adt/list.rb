# frozen_string_literal: true

module ADT
  class SingleLinkedList
    include Enumerable

    attr_reader :head, :size

    def initialize
      @head = nil
      @last = nil
      @size = 0
    end

    def self.create_from_array(array)
      list = new
      array.each do |data|
        list.add(data)
      end
      list
    end

    def add(data)
      node = SLNode.new data
      if @head.nil?
        @head = node
        @last = @head
      else
        @last.next = node
        @last = node
      end
      @size += 1
    end

    def add_to_head(data)
      node = SLNode.new data
      if @head.nil?
      else
        node.next = @head
      end
      @head = node
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

      previous = nil
      current = @head
      until current.nil?
        if current.data == data
          if previous.nil?
            @head = @head.next
            @last = nil if @head.nil?
          else
            previous.next = current.next
            @last = previous if previous.next.nil?
          end
          @size -= 1
          break
        end
        previous = current
        current = current.next
      end
    end

    def empty?
      @head.nil?
    end

    def merge!(list)
      return if list.empty?

      if empty?
        @head = list.head
        @size = list.size
      else
        @last.next = list.head
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
      arr = []
      each_node do |value|
        arr << value
      end
      arr
    end

    # returns all possible combinations of two lists where the order of elements inside each list is maintained
    def self.weave(xs, ys)
      if xs.empty?
        list = SingleLinkedList.new
        list.add(ys)
        return list
      end

      if ys.empty?
        list = SingleLinkedList.new
        list.add(xs)
        return list
      end

      x = xs.head
      xt = xs.tail
      y = ys.head
      yt = ys.tail

      weaved_lists = SingleLinkedList.new

      weave(xt, ys).each do |list|
        nl = SingleLinkedList.new
        nl.add(x.data)
        nl.merge!(list)
        weaved_lists.add(nl)
      end

      weave(yt, xs).each do |list|
        nl = SingleLinkedList.new
        nl.add(y.data)
        nl.merge!(list)
        weaved_lists.add(nl)
      end

      weaved_lists
    end

    def tail
      t = SingleLinkedList.new
      t.head = @head.next
      t.size = @size - 1
      t
    end

    protected

    attr_writer :head, :size
  end

  class SLNode
    attr_reader :data
    attr_accessor :next

    def initialize(data)
      @data = data
    end
  end
end
