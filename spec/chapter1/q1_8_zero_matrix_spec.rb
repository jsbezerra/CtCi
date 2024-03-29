# frozen_string_literal: true

require "rspec"
require "chapter1/arrays"

describe "Arrays#zero_matrix!" do
  example "matrix with no zeros" do
    matrix = [
      [1, 2, 3, 4, 5],
      [5, 4, 3, 2, 1]
    ]

    result = [
      [1, 2, 3, 4, 5],
      [5, 4, 3, 2, 1]
    ]

    Chapter1::Arrays.zero_matrix!(matrix)
    expect(matrix).to eq(result)
  end

  example "matrix with one zero" do
    matrix = [
      [1, 2, 3, 4, 5, 7, 9],
      [5, 4, 3, 2, 1, 8, 3],
      [5, 4, 3, 2, 1, 8, 3],
      [5, 0, 3, 2, 1, 8, 3],
      [5, 4, 3, 2, 1, 8, 3],
      [5, 4, 3, 2, 1, 8, 3],
      [5, 4, 3, 2, 1, 8, 3],
      [5, 4, 3, 2, 1, 8, 3]
    ]

    result = [
      [1, 0, 3, 4, 5, 7, 9],
      [5, 0, 3, 2, 1, 8, 3],
      [5, 0, 3, 2, 1, 8, 3],
      [0, 0, 0, 0, 0, 0, 0],
      [5, 0, 3, 2, 1, 8, 3],
      [5, 0, 3, 2, 1, 8, 3],
      [5, 0, 3, 2, 1, 8, 3],
      [5, 0, 3, 2, 1, 8, 3]
    ]

    Chapter1::Arrays.zero_matrix!(matrix)
    expect(matrix).to eq(result)
  end

  example "matrix with multiple zeros" do
    matrix = [
      [1, 2, 3, 4, 5, 7, 9],
      [5, 4, 3, 2, 1, 8, 3],
      [5, 4, 3, 2, 1, 8, 3],
      [5, 0, 3, 2, 1, 8, 3],
      [5, 4, 3, 2, 1, 0, 3],
      [5, 4, 3, 2, 1, 8, 3],
      [5, 4, 3, 2, 1, 8, 3],
      [5, 4, 3, 2, 1, 8, 3]
    ]

    result = [
      [1, 0, 3, 4, 5, 0, 9],
      [5, 0, 3, 2, 1, 0, 3],
      [5, 0, 3, 2, 1, 0, 3],
      [0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0],
      [5, 0, 3, 2, 1, 0, 3],
      [5, 0, 3, 2, 1, 0, 3],
      [5, 0, 3, 2, 1, 0, 3]
    ]

    Chapter1::Arrays.zero_matrix!(matrix)
    expect(matrix).to eq(result)
  end

  example "matrix with zero on first column" do
    matrix = [
      [1, 2, 3, 4, 5, 7, 9],
      [0, 4, 3, 2, 1, 8, 3],
      [5, 4, 3, 2, 1, 8, 3],
      [5, 0, 3, 2, 1, 8, 3],
      [5, 4, 3, 2, 1, 0, 3],
      [5, 4, 3, 2, 1, 8, 3],
      [5, 4, 3, 2, 1, 8, 3],
      [5, 4, 3, 2, 1, 8, 3]
    ]

    result = [
      [0, 0, 3, 4, 5, 0, 9],
      [0, 0, 0, 0, 0, 0, 0],
      [0, 0, 3, 2, 1, 0, 3],
      [0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0],
      [0, 0, 3, 2, 1, 0, 3],
      [0, 0, 3, 2, 1, 0, 3],
      [0, 0, 3, 2, 1, 0, 3]
    ]

    Chapter1::Arrays.zero_matrix!(matrix)
    expect(matrix).to eq(result)
  end

  example "matrix with zero on first row" do
    matrix = [
      [1, 1, 1, 1, 0, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 0, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1]
    ]

    result = [
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [1, 1, 1, 1, 0, 1, 0, 1, 1],
      [1, 1, 1, 1, 0, 1, 0, 1, 1],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [1, 1, 1, 1, 0, 1, 0, 1, 1]
    ]

    Chapter1::Arrays.zero_matrix!(matrix)
    expect(matrix).to eq(result)
  end
end

describe "Arrays#zero_matrix_b!" do
  example "matrix with no zeros" do
    matrix = [
      [1, 2, 3, 4, 5],
      [5, 4, 3, 2, 1]
    ]

    result = [
      [1, 2, 3, 4, 5],
      [5, 4, 3, 2, 1]
    ]

    Chapter1::Arrays.zero_matrix_b!(matrix)
    expect(matrix).to eq(result)
  end

  example "matrix with one zero" do
    matrix = [
      [1, 2, 3, 4, 5, 7, 9],
      [5, 4, 3, 2, 1, 8, 3],
      [5, 4, 3, 2, 1, 8, 3],
      [5, 0, 3, 2, 1, 8, 3],
      [5, 4, 3, 2, 1, 8, 3],
      [5, 4, 3, 2, 1, 8, 3],
      [5, 4, 3, 2, 1, 8, 3],
      [5, 4, 3, 2, 1, 8, 3]
    ]

    result = [
      [1, 0, 3, 4, 5, 7, 9],
      [5, 0, 3, 2, 1, 8, 3],
      [5, 0, 3, 2, 1, 8, 3],
      [0, 0, 0, 0, 0, 0, 0],
      [5, 0, 3, 2, 1, 8, 3],
      [5, 0, 3, 2, 1, 8, 3],
      [5, 0, 3, 2, 1, 8, 3],
      [5, 0, 3, 2, 1, 8, 3]
    ]

    Chapter1::Arrays.zero_matrix_b!(matrix)
    expect(matrix).to eq(result)
  end

  example "matrix with multiple zeros" do
    matrix = [
      [1, 2, 3, 4, 5, 7, 9],
      [5, 4, 3, 2, 1, 8, 3],
      [5, 4, 3, 2, 1, 8, 3],
      [5, 0, 3, 2, 1, 8, 3],
      [5, 4, 3, 2, 1, 0, 3],
      [5, 4, 3, 2, 1, 8, 3],
      [5, 4, 3, 2, 1, 8, 3],
      [5, 4, 3, 2, 1, 8, 3]
    ]

    result = [
      [1, 0, 3, 4, 5, 0, 9],
      [5, 0, 3, 2, 1, 0, 3],
      [5, 0, 3, 2, 1, 0, 3],
      [0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0],
      [5, 0, 3, 2, 1, 0, 3],
      [5, 0, 3, 2, 1, 0, 3],
      [5, 0, 3, 2, 1, 0, 3]
    ]

    Chapter1::Arrays.zero_matrix_b!(matrix)
    expect(matrix).to eq(result)
  end

  example "matrix with zero on first column" do
    matrix = [
      [1, 2, 3, 4, 5, 7, 9],
      [0, 4, 3, 2, 1, 8, 3],
      [5, 4, 3, 2, 1, 8, 3],
      [5, 0, 3, 2, 1, 8, 3],
      [5, 4, 3, 2, 1, 0, 3],
      [5, 4, 3, 2, 1, 8, 3],
      [5, 4, 3, 2, 1, 8, 3],
      [5, 4, 3, 2, 1, 8, 3]
    ]

    result = [
      [0, 0, 3, 4, 5, 0, 9],
      [0, 0, 0, 0, 0, 0, 0],
      [0, 0, 3, 2, 1, 0, 3],
      [0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0],
      [0, 0, 3, 2, 1, 0, 3],
      [0, 0, 3, 2, 1, 0, 3],
      [0, 0, 3, 2, 1, 0, 3]
    ]

    Chapter1::Arrays.zero_matrix_b!(matrix)
    expect(matrix).to eq(result)
  end

  example "matrix with zero on first row" do
    matrix = [
      [1, 1, 1, 1, 0, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 0, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1]
    ]

    result = [
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [1, 1, 1, 1, 0, 1, 0, 1, 1],
      [1, 1, 1, 1, 0, 1, 0, 1, 1],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [1, 1, 1, 1, 0, 1, 0, 1, 1]
    ]

    Chapter1::Arrays.zero_matrix_b!(matrix)
    expect(matrix).to eq(result)
  end
end
