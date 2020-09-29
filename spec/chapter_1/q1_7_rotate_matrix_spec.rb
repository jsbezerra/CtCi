require 'rspec'
require 'chapter_1/arrays'

describe 'Arrays#rotate_matrix' do

  example "returns a matrix rotated 90 degrees clockwise" do
    matrix = [
        %w[00 01 02 03 04],
        %w[10 11 12 13 14],
        %w[20 21 22 23 24],
        %w[30 31 32 33 34],
        %w[40 41 42 43 44]
    ]

    result = [
        %w[40 30 20 10 00],
        %w[41 31 21 11 01],
        %w[42 32 22 12 02],
        %w[43 33 23 13 03],
        %w[44 34 24 14 04]
    ]

    expect(Chapter1::Arrays.rotate_matrix(matrix)).to eq(result)
  end
end

describe 'Arrays#rotate_matrix_transpose' do

  example "returns a matrix rotated 90 degrees clockwise" do
    matrix = [
        %w[00 01 02 03 04],
        %w[10 11 12 13 14],
        %w[20 21 22 23 24],
        %w[30 31 32 33 34],
        %w[40 41 42 43 44]
    ]

    result = [
        %w[40 30 20 10 00],
        %w[41 31 21 11 01],
        %w[42 32 22 12 02],
        %w[43 33 23 13 03],
        %w[44 34 24 14 04]
    ]

    expect(Chapter1::Arrays.rotate_matrix_transpose(matrix)).to eq(result)
  end
end

describe 'Arrays#rotate_matrix!' do

  example "rotates a matrix 90 degrees clockwise" do
    pending 'Not implemented yet'
    matrix = [
        %w[00 01 02 03 04],
        %w[10 11 12 13 14],
        %w[20 21 22 23 24],
        %w[30 31 32 33 34],
        %w[40 41 42 43 44]
    ]

    result = [
        %w[40 30 20 10 00],
        %w[41 31 21 11 01],
        %w[42 32 22 12 02],
        %w[43 33 23 13 03],
        %w[44 34 24 14 04]
    ]

    Chapter1::Arrays.rotate_matrix!(matrix)
    expect(matrix).to eq(result)
  end
end