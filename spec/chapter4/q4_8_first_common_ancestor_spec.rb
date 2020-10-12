require 'rspec'
require 'chapter4/trees'
require 'support/binary_tree_helper'

describe 'Node#first_common_ancestor' do

  include BinaryTreeHelper

  context 'using a balanced binary tree with 10 nodes' do

    before(:context) do
      @root = balanced_bst_10_nodes
      @nodes = @root.in_order_nodes
    end

    example "should return nil when the first value is not in the tree" do
      fca = @root.first_common_ancestor(0, 7)
      expect(fca).to be_nil
    end

    example "should return nil when the second value is not in the tree" do
      fca = @root.first_common_ancestor(3, 11)
      expect(fca).to be_nil
    end

    example "should return nil when none of the values are in the tree" do
      fca = @root.first_common_ancestor(-5, 73)
      expect(fca).to be_nil
    end

    example "given (1, 2) should return 1" do
      fca = @root.first_common_ancestor(1, 2)
      expect(fca.data).to be(1)
    end

    example "given (2, 1) should return 1" do
      fca = @root.first_common_ancestor(2, 1)
      expect(fca.data).to be(1)
    end

    example "given (1, 3) should return 3" do
      fca = @root.first_common_ancestor(1, 3)
      expect(fca.data).to be(3)
    end

    example "given (3, 1) should return 3" do
      fca = @root.first_common_ancestor(3, 1)
      expect(fca.data).to be(3)
    end

    example "given (1, 4) should return 3" do
      fca = @root.first_common_ancestor(1, 4)
      expect(fca.data).to be(3)
    end

    example "given (4, 1) should return 3" do
      fca = @root.first_common_ancestor(4, 1)
      expect(fca.data).to be(3)
    end

    example "given (1, 5) should return 5" do
      fca = @root.first_common_ancestor(1, 5)
      expect(fca.data).to be(5)
    end

    example "given (5, 1) should return 5" do
      fca = @root.first_common_ancestor(5, 1)
      expect(fca.data).to be(5)
    end

    example "given (1, 8) should return 5" do
      fca = @root.first_common_ancestor(1, 8)
      expect(fca.data).to be(5)
    end

    example "given (8, 1) should return 5" do
      fca = @root.first_common_ancestor(8, 1)
      expect(fca.data).to be(5)
    end

    example "given (1, 6) should return 5" do
      fca = @root.first_common_ancestor(1, 6)
      expect(fca.data).to be(5)
    end

    example "given (6, 1) should return 5" do
      fca = @root.first_common_ancestor(6, 1)
      expect(fca.data).to be(5)
    end

    example "given (1, 10) should return 5" do
      fca = @root.first_common_ancestor(1, 10)
      expect(fca.data).to be(5)
    end

    example "given (10, 1) should return 5" do
      fca = @root.first_common_ancestor(10, 1)
      expect(fca.data).to be(5)
    end

    example "given (1, 7) should return 5" do
      fca = @root.first_common_ancestor(1, 7)
      expect(fca.data).to be(5)
    end

    example "given (7, 1) should return 5" do
      fca = @root.first_common_ancestor(7, 1)
      expect(fca.data).to be(5)
    end

    example "given (1, 9) should return 5" do
      fca = @root.first_common_ancestor(1, 9)
      expect(fca.data).to be(5)
    end

    example "given (9, 1) should return 5" do
      fca = @root.first_common_ancestor(9, 1)
      expect(fca.data).to be(5)
    end

    example "given (2, 4) should return 3" do
      fca = @root.first_common_ancestor(2, 4)
      expect(fca.data).to be(3)
    end

    example "given (4, 2) should return 3" do
      fca = @root.first_common_ancestor(4, 2)
      expect(fca.data).to be(3)
    end

    example "given (2, 3) should return 3" do
      fca = @root.first_common_ancestor(2, 3)
      expect(fca.data).to be(3)
    end

    example "given (3, 2) should return 3" do
      fca = @root.first_common_ancestor(3, 2)
      expect(fca.data).to be(3)
    end

    example "given (2, 5) should return 5" do
      fca = @root.first_common_ancestor(2, 5)
      expect(fca.data).to be(5)
    end

    example "given (5, 2) should return 5" do
      fca = @root.first_common_ancestor(5, 2)
      expect(fca.data).to be(5)
    end

    example "given (2, 8) should return 5" do
      fca = @root.first_common_ancestor(2, 8)
      expect(fca.data).to be(5)
    end

    example "given (8, 2) should return 5" do
      fca = @root.first_common_ancestor(8, 2)
      expect(fca.data).to be(5)
    end

    example "given (2, 6) should return 5" do
      fca = @root.first_common_ancestor(2, 6)
      expect(fca.data).to be(5)
    end

    example "given (6, 2) should return 5" do
      fca = @root.first_common_ancestor(6, 2)
      expect(fca.data).to be(5)
    end

    example "given (2, 10) should return 5" do
      fca = @root.first_common_ancestor(2, 10)
      expect(fca.data).to be(5)
    end

    example "given (10, 2) should return 5" do
      fca = @root.first_common_ancestor(10, 2)
      expect(fca.data).to be(5)
    end

    example "given (2, 7) should return 5" do
      fca = @root.first_common_ancestor(2, 7)
      expect(fca.data).to be(5)
    end

    example "given (7, 2) should return 5" do
      fca = @root.first_common_ancestor(7, 2)
      expect(fca.data).to be(5)
    end

    example "given (2, 9) should return 5" do
      fca = @root.first_common_ancestor(2, 9)
      expect(fca.data).to be(5)
    end

    example "given (9, 2) should return 5" do
      fca = @root.first_common_ancestor(9, 2)
      expect(fca.data).to be(5)
    end

    example "given (3, 4) should return 3" do
      fca = @root.first_common_ancestor(3, 4)
      expect(fca.data).to be(3)
    end

    example "given (4, 3) should return 3" do
      fca = @root.first_common_ancestor(4, 3)
      expect(fca.data).to be(3)
    end

    example "given (3, 5) should return 5" do
      fca = @root.first_common_ancestor(3, 5)
      expect(fca.data).to be(5)
    end

    example "given (5, 3) should return 5" do
      fca = @root.first_common_ancestor(5, 3)
      expect(fca.data).to be(5)
    end

    example "given (3, 8) should return 5" do
      fca = @root.first_common_ancestor(3, 8)
      expect(fca.data).to be(5)
    end

    example "given (8, 3) should return 5" do
      fca = @root.first_common_ancestor(8, 3)
      expect(fca.data).to be(5)
    end

    example "given (3, 6) should return 5" do
      fca = @root.first_common_ancestor(3, 6)
      expect(fca.data).to be(5)
    end

    example "given (6, 3) should return 5" do
      fca = @root.first_common_ancestor(6, 3)
      expect(fca.data).to be(5)
    end

    example "given (3, 10) should return 5" do
      fca = @root.first_common_ancestor(3, 10)
      expect(fca.data).to be(5)
    end

    example "given (10, 3) should return 5" do
      fca = @root.first_common_ancestor(10, 3)
      expect(fca.data).to be(5)
    end

    example "given (3, 7) should return 5" do
      fca = @root.first_common_ancestor(3, 7)
      expect(fca.data).to be(5)
    end

    example "given (7, 3) should return 5" do
      fca = @root.first_common_ancestor(7, 3)
      expect(fca.data).to be(5)
    end

    example "given (3, 9) should return 5" do
      fca = @root.first_common_ancestor(3, 9)
      expect(fca.data).to be(5)
    end

    example "given (9, 3) should return 5" do
      fca = @root.first_common_ancestor(9, 3)
      expect(fca.data).to be(5)
    end

    example "given (4, 5) should return 5" do
      fca = @root.first_common_ancestor(4, 5)
      expect(fca.data).to be(5)
    end

    example "given (5, 4) should return 5" do
      fca = @root.first_common_ancestor(5, 4)
      expect(fca.data).to be(5)
    end

    example "given (4, 8) should return 5" do
      fca = @root.first_common_ancestor(4, 8)
      expect(fca.data).to be(5)
    end

    example "given (8, 4) should return 5" do
      fca = @root.first_common_ancestor(8, 4)
      expect(fca.data).to be(5)
    end

    example "given (4, 6) should return 5" do
      fca = @root.first_common_ancestor(4, 6)
      expect(fca.data).to be(5)
    end

    example "given (6, 4) should return 5" do
      fca = @root.first_common_ancestor(6, 4)
      expect(fca.data).to be(5)
    end

    example "given (4, 10) should return 5" do
      fca = @root.first_common_ancestor(4, 10)
      expect(fca.data).to be(5)
    end

    example "given (10, 4) should return 5" do
      fca = @root.first_common_ancestor(10, 4)
      expect(fca.data).to be(5)
    end

    example "given (4, 7) should return 5" do
      fca = @root.first_common_ancestor(4, 7)
      expect(fca.data).to be(5)
    end

    example "given (7, 4) should return 5" do
      fca = @root.first_common_ancestor(7, 4)
      expect(fca.data).to be(5)
    end

    example "given (4, 9) should return 5" do
      fca = @root.first_common_ancestor(4, 9)
      expect(fca.data).to be(5)
    end

    example "given (9, 4) should return 5" do
      fca = @root.first_common_ancestor(9, 4)
      expect(fca.data).to be(5)
    end

    example "given (5, 6) should return 5" do
      fca = @root.first_common_ancestor(5, 6)
      expect(fca.data).to be(5)
    end

    example "given (6, 5) should return 5" do
      fca = @root.first_common_ancestor(6, 5)
      expect(fca.data).to be(5)
    end

    example "given (5, 8) should return 5" do
      fca = @root.first_common_ancestor(5, 8)
      expect(fca.data).to be(5)
    end

    example "given (8, 5) should return 5" do
      fca = @root.first_common_ancestor(8, 5)
      expect(fca.data).to be(5)
    end

    example "given (5, 10) should return 5" do
      fca = @root.first_common_ancestor(5, 10)
      expect(fca.data).to be(5)
    end

    example "given (10, 5) should return 5" do
      fca = @root.first_common_ancestor(10, 5)
      expect(fca.data).to be(5)
    end

    example "given (5, 7) should return 5" do
      fca = @root.first_common_ancestor(5, 7)
      expect(fca.data).to be(5)
    end

    example "given (7, 5) should return 5" do
      fca = @root.first_common_ancestor(7, 5)
      expect(fca.data).to be(5)
    end

    example "given (5, 9) should return 5" do
      fca = @root.first_common_ancestor(5, 9)
      expect(fca.data).to be(5)
    end

    example "given (9, 5) should return 5" do
      fca = @root.first_common_ancestor(9, 5)
      expect(fca.data).to be(5)
    end

    example "given (6, 8) should return 8" do
      fca = @root.first_common_ancestor(6, 8)
      expect(fca.data).to be(8)
    end

    example "given (8, 6) should return 8" do
      fca = @root.first_common_ancestor(8, 6)
      expect(fca.data).to be(8)
    end

    example "given (6, 10) should return 8" do
      fca = @root.first_common_ancestor(6, 10)
      expect(fca.data).to be(8)
    end

    example "given (10, 6) should return 8" do
      fca = @root.first_common_ancestor(10, 6)
      expect(fca.data).to be(8)
    end

    example "given (6, 7) should return 6" do
      fca = @root.first_common_ancestor(6, 7)
      expect(fca.data).to be(6)
    end

    example "given (7, 6) should return 6" do
      fca = @root.first_common_ancestor(7, 6)
      expect(fca.data).to be(6)
    end

    example "given (6, 9) should return 8" do
      fca = @root.first_common_ancestor(6, 9)
      expect(fca.data).to be(8)
    end

    example "given (9, 6) should return 8" do
      fca = @root.first_common_ancestor(9, 6)
      expect(fca.data).to be(8)
    end

    example "given (8, 7) should return 8" do
      fca = @root.first_common_ancestor(8, 7)
      expect(fca.data).to be(8)
    end

    example "given (7, 8) should return 8" do
      fca = @root.first_common_ancestor(7, 8)
      expect(fca.data).to be(8)
    end

    example "given (8, 10) should return 8" do
      fca = @root.first_common_ancestor(8, 10)
      expect(fca.data).to be(8)
    end

    example "given (10, 8) should return 8" do
      fca = @root.first_common_ancestor(10, 8)
      expect(fca.data).to be(8)
    end

    example "given (8, 9) should return 8" do
      fca = @root.first_common_ancestor(8, 9)
      expect(fca.data).to be(8)
    end

    example "given (9, 8) should return 8" do
      fca = @root.first_common_ancestor(9, 8)
      expect(fca.data).to be(8)
    end

    example "given (10, 9) should return 10" do
      fca = @root.first_common_ancestor(10, 9)
      expect(fca.data).to be(10)
    end

    example "given (9, 10) should return 10" do
      fca = @root.first_common_ancestor(9, 10)
      expect(fca.data).to be(10)
    end

    example "given (7, 9) should return 8" do
      fca = @root.first_common_ancestor(7, 9)
      expect(fca.data).to be(8)
    end

    example "given (9, 7) should return 8" do
      fca = @root.first_common_ancestor(9, 7)
      expect(fca.data).to be(8)
    end

    example "given (7, 7) should return 7" do
      fca = @root.first_common_ancestor(7, 7)
      expect(fca.data).to be(7)
    end

    example "given (5, 5) should return 5" do
      fca = @root.first_common_ancestor(5, 5)
      expect(fca.data).to be(5)
    end

  end
end