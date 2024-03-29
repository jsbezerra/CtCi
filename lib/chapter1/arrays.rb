# frozen_string_literal: true

module Chapter1
  module Arrays
    # Q1.7 a) Rotate Matrix: Given an image represented by an NxM matrix, where each pixel in the image is 4 bytes,
    # write a method to rotate the image by 90 degrees.
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

    # Q1.7 a) Rotate Matrix: Given an image represented by an NxM matrix, where each pixel in the image is 4 bytes,
    # write a method to rotate the image by 90 degrees.
    # (Uses ruby transpose)
    def self.rotate_matrix_transpose(matrix)
      result = []
      matrix.transpose.each do |row|
        result << row.reverse
      end
      result
    end

    # Q1.7 b) Rotate Matrix: Given an image represented by an NxM matrix, where each pixel in the image is 4 bytes,
    #  write a method to rotate the image by 90 degrees.
    # (Can you do this in place?)
    def self.rotate_matrix!(matrix)
      size = matrix.size
      layer = 0
      while layer < size / 2
        i = layer
        n = size - layer - 1
        (i..n - 1).each do |j|
          off = j - i
          tmp = matrix[i][j]
          matrix[i][j] = matrix[n - off][i]
          matrix[n - off][i] = matrix[n][n - off]
          matrix[n][n - off] = matrix[j][n]
          matrix[j][n] = tmp
        end
        layer += 1
      end
    end

    # Q1.8 a) Zero Matrix: Write an algorithm such that if an element in a MxN matrix is 0, its entire row and column
    # are set to 0.
    def self.zero_matrix!(matrix)
      rows = []
      columns = []
      m = matrix.size - 1
      n = matrix[0].size - 1

      matrix.each_with_index do |row, i|
        row.each_with_index do |value, j|
          if value.zero?
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
    # are set to 0.
    # In order not to use additional storage, we use the first row and first column as placeholders for the rows and
    # columns that will have to be "zeroed". Therefore, we have to analyse them first to know if they need to be zeroed,
    # but actually do that as the last step in the algorithm.
    def self.zero_matrix_b!(matrix)
      rows_size = matrix.size - 1
      columns_size = matrix[0].size - 1
      first_row_has_zero = matrix[0].reduce(false) do |acc, value|
        acc || value.zero?
      end

      first_column_has_zero = (0..rows_size).reduce(false) do |acc, i|
        acc || (matrix[i][0]).zero?
      end

      (1..rows_size).each do |i|
        (1..columns_size).each do |j|
          if (matrix[i][j]).zero?
            matrix[i][0] = 0
            matrix[0][j] = 0
          end
        end
      end

      # zero rows based on first column
      (1..rows_size).each do |i|
        next unless (matrix[i][0]).zero?

        (1..columns_size).each do |j|
          matrix[i][j] = 0
        end
      end

      # zero columns based on first row
      (1..columns_size).each do |j|
        next unless (matrix[0][j]).zero?

        (1..rows_size).each do |i|
          matrix[i][j] = 0
        end
      end

      if first_row_has_zero
        (0..columns_size).each do |j|
          matrix[0][j] = 0
        end
      end

      if first_column_has_zero
        (0..rows_size).each do |i|
          matrix[i][0] = 0
        end
      end
    end
  end
end
