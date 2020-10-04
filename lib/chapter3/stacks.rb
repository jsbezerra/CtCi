require 'adt/stack'

module ADT

  # Q3.2) Stack Min: How would you design a stack which, in addition to +push+ and +pop+, has a function +min+ which
  # returns the minimum element? +push+, +pop+ and +min+ should all operate in O(1) time.
  class StackMin < ADT::Stack

    def push(data)
      if empty?
        element = [data, data]
      else
        min = [data, self.min].min
        element = [data, min]
      end
      super(element)
    end

    def pop
      return if empty?
      element = super
      element[0]
    end

    def peek
      return if empty?
      @top.data[0]
    end

    def min
      return if empty?
      @top.data[1]
    end
  end
end
