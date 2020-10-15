require 'rspec'
require 'chapter4/trees'
require 'support/binary_tree_helper'

describe 'Node#check_subtree' do

  include BinaryTreeHelper

  before(:context) do
    @root = balanced_bst_10_nodes
    @nodes = @root.in_order_nodes
  end

  context 'subtrees with nodes directly from the bigger tree' do
    example "1(nil,2) should be a subtree" do
      expect(@root.check_subtree?(@nodes[0])).to eq(true)
    end

    example "8(6(nil,7),10(9,nil)) should be a subtree" do
      expect(@root.check_subtree?(@nodes[7])).to eq(true)
    end

    example "7 should be a subtree" do
      expect(@root.check_subtree?(@nodes[6])).to eq(true)
    end
  end

  context 'subtrees created separately from the bigger tree' do
    example "1(nil,2) should be a subtree" do
      root2 = ADT::BinaryTree::Node.new 1
      root2.insert_right(ADT::BinaryTree::Node.new 2)
      expect(@root.check_subtree?(root2)).to eq(true)
    end

    example "8(6(nil,7),10(9,nil)) should be a subtree" do
      root2 = ADT::BinaryTree::Node.new 8
      root2.insert_left(ADT::BinaryTree::Node.new 6)
      root2.insert_right(ADT::BinaryTree::Node.new 10)
      root2.left.insert_right(ADT::BinaryTree::Node.new 7)
      root2.right.insert_left(ADT::BinaryTree::Node.new 9)
      expect(@root.check_subtree?(root2)).to eq(true)
    end

    example "7 should be a subtree" do
      root2 = ADT::BinaryTree::Node.new 7
      expect(@root.check_subtree?(root2)).to eq(true)
    end

    example "empty tree is always a subtree" do
      expect(@root.check_subtree?(nil)).to eq(true)
    end
  end

  context 'not subtrees' do
    example "1(0,2) should not be a subtree" do
      root2 = ADT::BinaryTree::Node.new 1
      root2.insert_left(ADT::BinaryTree::Node.new 0)
      root2.insert_right(ADT::BinaryTree::Node.new 2)
      expect(@root.check_subtree?(root2)).to eq(false)
    end

    example "8(6(nil,7),10(9,11)) should not be a subtree" do
      root2 = ADT::BinaryTree::Node.new 8
      root2.insert_left(ADT::BinaryTree::Node.new 6)
      root2.insert_right(ADT::BinaryTree::Node.new 10)
      root2.left.insert_right(ADT::BinaryTree::Node.new 7)
      root2.right.insert_left(ADT::BinaryTree::Node.new 9)
      root2.right.insert_right(ADT::BinaryTree::Node.new 11)
      expect(@root.check_subtree?(root2)).to eq(false)
    end

    example "11 should not be a subtree" do
      root2 = ADT::BinaryTree::Node.new 11
      expect(@root.check_subtree?(root2)).to eq(false)
    end
  end
end

describe 'Node#check_subtree_in_place' do

  include BinaryTreeHelper

  before(:context) do
    @root = balanced_bst_10_nodes
    @nodes = @root.in_order_nodes
  end

  context 'subtrees with nodes directly from the bigger tree' do
    example "1(nil,2) should be a subtree" do
      expect(@root.in_place_check_subtree?(@nodes[0])).to eq(true)
    end

    example "8(6(nil,7),10(9,nil)) should be a subtree" do
      expect(@root.in_place_check_subtree?(@nodes[7])).to eq(true)
    end

    example "7 should be a subtree" do
      expect(@root.in_place_check_subtree?(@nodes[6])).to eq(true)
    end
  end

  context 'subtrees created separately from the bigger tree' do
    example "1(nil,2) should be a subtree" do
      root2 = ADT::BinaryTree::Node.new 1
      root2.insert_right(ADT::BinaryTree::Node.new 2)
      expect(@root.in_place_check_subtree?(root2)).to eq(true)
    end

    example "8(6(nil,7),10(9,nil)) should be a subtree" do
      root2 = ADT::BinaryTree::Node.new 8
      root2.insert_left(ADT::BinaryTree::Node.new 6)
      root2.insert_right(ADT::BinaryTree::Node.new 10)
      root2.left.insert_right(ADT::BinaryTree::Node.new 7)
      root2.right.insert_left(ADT::BinaryTree::Node.new 9)
      expect(@root.in_place_check_subtree?(root2)).to eq(true)
    end

    example "7 should be a subtree" do
      root2 = ADT::BinaryTree::Node.new 7
      expect(@root.in_place_check_subtree?(root2)).to eq(true)
    end

    example "empty tree is always a subtree" do
      expect(@root.in_place_check_subtree?(nil)).to eq(true)
    end
  end

  context 'not subtrees' do
    example "1(0,2) should not be a subtree" do
      root2 = ADT::BinaryTree::Node.new 1
      root2.insert_left(ADT::BinaryTree::Node.new 0)
      root2.insert_right(ADT::BinaryTree::Node.new 2)
      expect(@root.in_place_check_subtree?(root2)).to eq(false)
    end

    example "8(6(nil,7),10(9,11)) should not be a subtree" do
      root2 = ADT::BinaryTree::Node.new 8
      root2.insert_left(ADT::BinaryTree::Node.new 6)
      root2.insert_right(ADT::BinaryTree::Node.new 10)
      root2.left.insert_right(ADT::BinaryTree::Node.new 7)
      root2.right.insert_left(ADT::BinaryTree::Node.new 9)
      root2.right.insert_right(ADT::BinaryTree::Node.new 11)
      expect(@root.in_place_check_subtree?(root2)).to eq(false)
    end

    example "11 should not be a subtree" do
      root2 = ADT::BinaryTree::Node.new 11
      expect(@root.in_place_check_subtree?(root2)).to eq(false)
    end
  end
end