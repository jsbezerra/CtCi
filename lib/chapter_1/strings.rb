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
    def self.check_permutation_hash?(str1, str2)
      return false if str1.size != str2.size

      chars1, chars2 = str1.chars, str2.chars
      hash1, hash2 = Hash.new, Hash.new

      (0..chars1.size - 1).each do |i|
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
    def self.check_permutation_sort?(str1, str2)
      return false if str1.size != str2.size
      return str1.chars.sort == str2.chars.sort
    end

    # Q1.3) URLify: Write a method to replace all spaces in a string with '%20'.
    def self.urlify(str)
      chars = str.chars
      space_count = 0
      chars.each do |c|
        if c == ' '
          space_count += 1
        end
      end

      return str if space_count == 0
      ending = Array.new(space_count * 2, ' ')
      chars.concat(ending)
      j = chars.size - 1
      (str.size - 1).downto(0).each do |i|
        if chars[i] == ' '
          chars[j] = '0'
          chars[j -= 1] = '2'
          chars[j -= 1] = '%'
        else
          chars[j] = chars[i]
        end
        j -= 1
      end
      chars.join
    end

    # Q1.4) Palindrome Permutation: Given a string, write a function to check if it is a permutation of a palindrome.
    # (Ignores whitespaces and cases)
    def self.palindrome_permutation?(str)
      hash = Hash.new
      str.downcase.chars.each do |c|
        if c == ' '
          next
        elsif hash.has_key? c
          hash[c] += 1
        else
          hash[c] = 1
        end
      end

      found_odd = false
      hash.each_value do |count|
        if count % 2 != 0
          return false if found_odd
          found_odd = true
        end
      end
      return true
    end

    # Q1.5) One Away: There are three types of edits that can be performed on strings: insert a character, remove a
    # character, or replace a character. Given two string, write a function to check if they are one edit (or zero
    # edits) away.
    def self.one_away?(str1, str2)
      return true if str1 == str2
      return false if (str1.size - str2.size).abs > 1
      if str1.size > str2.size
        chars1 = str1.chars
        chars2 = str2.chars
      else
        chars1 = str2.chars
        chars2 = str1.chars
      end
      i, j = 0, 0
      found_difference = false
      while i < chars1.size && j < chars2.size
        return false if found_difference && chars1[i] != chars2[j]
        if chars1[i] != chars2[j]
          found_difference = true
          if chars1[i + 1] == chars2[j]
            i += 1
          elsif chars1[i + 1] == chars2[j + 1]
            i += 1
            j += 1
          else
            return false
          end
        end
        i += 1
        j += 1
      end
      return !found_difference || (i == chars1.size && j == chars2.size)
    end

    # Q1.6) String Compression: Implement a method to perform basic string compression using the counts of repeated
    # characters. For example, the string "aabcccccaaa" would become "a2b1c5a3". If the compressed string would not
    # become smaller  than the original string, your method should return the original string. You can assume the string
    # has only uppercase and lowercase letters (a - z).
    def self.string_compression(str)
      return str if str.size <= 1
      chars = str.chars
      compressed = []
      count = 0
      (0..chars.size - 1).each do |i|
        count += 1
        if chars[i + 1] != chars[i]
          compressed << "#{chars[i]}#{count}"
          count = 0
        end
      end
      compressed = compressed.join
      compressed.size < str.size ? compressed : str
    end

    # Q1.7 a) Rotate Matrix: Given an image represented by an NxM matrix, where each pixen in the image is 4 bytes, write a
    # method to rotate the image by 90 degrees.
    def self.rotate_matrix(matrix)
      n = matrix.size
      result = Array.new(n)
      (0..n - 1).each do |i|
        result[i] = Array.new(n)
        (0..n - 1).each do |j|
          result[i][j] = matrix[n - j - 1][i]
        end
      end
      result
    end

    # Q1.7 a) Rotate Matrix: Given an image represented by an NxM matrix, where each pixen in the image is 4 bytes, write a
    # method to rotate the image by 90 degrees.
    # (Uses ruby transpose)
    def self.rotate_matrix_transpose(matrix)
      result = []
      matrix.transpose.each do |row|
        result << row.reverse
      end
      result
    end

    # Q1.7 b) Rotate Matrix: Given an image represented by an NxM matrix, where each pixen in the image is 4 bytes, write a
    # method to rotate the image by 90 degrees.
    # (Can you do this in place)
    def self.rotate_matrix!(matrix)
      throw NotImplementedError
    end

    # Q1.8 a) Zero Matrix: Write an algorithm such that if an element in a MxN matrix is 0, its entire row and column
    # are set to 0.
    def self.zero_matrix!(matrix)
      rows, columns = [], []
      m = matrix.size - 1
      n = matrix[0].size - 1

      matrix.each_with_index do |row, i|
        row.each_with_index do |value, j|
          if value == 0
            rows << i
            columns << j
          end
        end
      end

      rows.each do |i|
        (0..n).each do |j|
          matrix[i][j] = 0
        end
      end

      columns.each do |j|
        (0..m).each do |i|
          matrix[i][j] = 0
        end
      end
    end

    # Q1.8 b) Zero Matrix: Write an algorithm such that if an element in a MxN matrix is 0, its entire row and column
    # are set to 0. (Do not use additional storage)
    def self.zero_matrix_b!(matrix)
      throw NotImplementedError
    end
  end
end
