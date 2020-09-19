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

    # Q1.2 a) Check Permutation: Given two strings, write a method to decide if one is a permutation of the other.
    def self.check_permutation_hash?(str1,str2)
      return false if str1.size != str2.size

      chars1, chars2 = str1.chars, str2.chars
      hash1, hash2 = Hash.new, Hash.new

      (0..chars1.size-1).each do |i|
        if hash1.has_key? chars1[i]
          hash1[chars1[i]] += 1
        else
          hash1[chars1[i]] = 1
        end

        if hash2.has_key? chars2[i]
          hash2[chars2[i]] += 1
        else
          hash2[chars2[i]] = 1
        end
      end
      return hash1 == hash2
    end

    # Q1.2 b) Check Permutation: Given two strings, write a method to decide if one is a permutation of the other.
    # (Without additional data structures)
    def self.check_permutation_sort?(str1,str2)
      return false if str1.size != str2.size
      return str1.chars.sort == str2.chars.sort
    end

    # Q1.3) URLify: Write a method to replace all spaces in a string with '%20'.
    def self.urlify(str)
      chars = str.chars
      space_count = 0
      chars.each do |c|
        if c == ' '
          space_count+=1
        end
      end

      return str if space_count == 0
      ending = Array.new(space_count * 2, ' ')
      chars.concat(ending)
      i = str.size - 1
      j = chars.size - 1
      i.downto(0).each do |i|
        if chars[i] == ' '
          chars[j] = '0'
          chars[j-=1] = '2'
          chars[j-=1] = '%'
        else
          chars[j] = chars[i]
        end
        j -= 1
      end
      chars.join
    end
  end
end
