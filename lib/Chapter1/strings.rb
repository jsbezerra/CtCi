module Chapter1
  module Strings

    # Q1.1 a) Is Unique: Implement an algorithm to determine if a string has all unique characters.
    def self.is_unique_hash?(str)
      hash = Hash.new
      str.chars.each do |c|
        if hash.has_key? c
          return false
        else
          hash[c] = true
        end
      end
      return true
    end

    # Q1.1 b) Is Unique: Implement an algorithm to determine if a string has all unique characters.
    # What if you cannot use additional data structures?
    def self.is_unique_sort?(str)
      ordered_chars = str.chars.sort
      (1..ordered_chars.size - 1).each { |i|
        if ordered_chars[i] == ordered_chars[i - 1]
          return false
        end
      }
      return true
    end
  end
end
