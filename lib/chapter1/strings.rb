# frozen_string_literal: true

module Chapter1
  module Strings
    # Q1.1 a) Is Unique: Implement an algorithm to determine if a string has all unique characters.
    def self.is_unique_hash?(str)
      hash = {}
      str.chars.each do |c|
        if hash.key? c
          return false
        else
          hash[c] = true
        end
      end
      true
    end

    # Q1.1 b) Is Unique: Implement an algorithm to determine if a string has all unique characters.
    # What if you cannot use additional data structures?
    def self.is_unique_sort?(str)
      ordered_chars = str.chars.sort
      (1..ordered_chars.size - 1).each do |i|
        return false if ordered_chars[i] == ordered_chars[i - 1]
      end
      true
    end

    # Q1.2 a) Check Permutation: Given two strings, write a method to decide if one is a permutation of the other.
    def self.check_permutation_hash?(str1, str2)
      return true if str1 == str2
      return false if str1.size != str2.size

      chars1 = str1.chars
      chars2 = str2.chars
      hash1 = {}
      hash2 = {}

      (0..chars1.size - 1).each do |i|
        if hash1.key? chars1[i]
          hash1[chars1[i]] += 1
        else
          hash1[chars1[i]] = 1
        end

        if hash2.key? chars2[i]
          hash2[chars2[i]] += 1
        else
          hash2[chars2[i]] = 1
        end
      end
      hash1 == hash2
    end

    # Q1.2 b) Check Permutation: Given two strings, write a method to decide if one is a permutation of the other.
    # (Without additional data structures)
    def self.check_permutation_sort?(str1, str2)
      return true if str1 == str2
      return false if str1.size != str2.size

      str1.chars.sort == str2.chars.sort
    end

    # Q1.3) URLify: Write a method to replace all spaces in a string with '%20'.
    def self.urlify(str)
      chars = str.chars
      space_count = 0
      chars.each do |c|
        space_count += 1 if c == " "
      end

      return str if space_count.zero?

      ending = Array.new(space_count * 2, " ")
      chars.concat(ending)
      j = chars.size - 1
      (str.size - 1).downto(0).each do |i|
        if chars[i] == " "
          chars[j] = "0"
          chars[j -= 1] = "2"
          chars[j -= 1] = "%"
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
      hash = {}
      str.downcase.chars.each do |c|
        if c == " "
          next
        elsif hash.key? c
          hash[c] += 1
        else
          hash[c] = 1
        end
      end

      found_odd = false
      hash.each_value do |count|
        next unless count.odd?
        return false if found_odd

        found_odd = true
      end
      true
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
      i = 0
      j = 0
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
      !found_difference || (i == chars1.size && j == chars2.size)
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

    # Q1.9) String Rotation: Assume you have a method +is_substring+ which checks if one word is a substring of another.
    # Given two strings, +s1+ and +s2+, write code to check if +s2+ is a rotation of +s1+ using only one call to +is_substring+.
    def self.string_rotation?(s1, s2)
      return false if s1.size != s2.size

      [s1, s1].join.include? s2
    end
  end
end
