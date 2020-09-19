require 'Chapter4/BinarySearchTree'

module Chapter4
  module MinimalTree

    def self.create_minimal_bts(values)
      self.minimal_bts(values, 0, values.size - 1)
    end

    private

    def self.minimal_bts(values, start, final)
      return nil if final < start
      mid = (start + final) / 2
      root = Node.new(values[mid])
      root.insert_left(minimal_bts(values, 0, mid - 1))
      root.insert_right(minimal_bts(values, mid + 1, final))
      return root
    end
  end
end