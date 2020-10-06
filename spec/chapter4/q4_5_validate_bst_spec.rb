require 'rspec'
require 'chapter4/trees'

describe 'TreeNode#validate_bst?' do

  example 'degenerate right tree that should be a bst' do
    root = ADT::BinaryTree::Node.new(1)
    n = root
    (2..5).each do |i|
      node = ADT::BinaryTree::Node.new(i)
      n.insert_right(node)
      n = node
    end
    expect(root.validate_bst?).to eq(true)
  end

  example 'degenerate right tree that should not be a bst' do
    root = ADT::BinaryTree::Node.new(1)
    n = root
    (2..5).each do |i|
      node = ADT::BinaryTree::Node.new(-i)
      n.insert_right(node)
      n = node
    end
    expect(root.validate_bst?).to eq(false)
  end

  example "balanced bst with 10 nodes should return true" do
    root = ADT::BinaryTree::Node.new(5)
    root.insert_left(ADT::BinaryTree::Node.new(3))
    root.left.insert_left(ADT::BinaryTree::Node.new(1))
    root.left.left.insert_right(ADT::BinaryTree::Node.new(2))
    root.left.insert_right(ADT::BinaryTree::Node.new(4))

    root.insert_right(ADT::BinaryTree::Node.new(8))
    root.right.insert_left(ADT::BinaryTree::Node.new(6))
    root.right.left.insert_right(ADT::BinaryTree::Node.new(7))
    root.right.insert_right(ADT::BinaryTree::Node.new(10))
    root.right.right.insert_left(ADT::BinaryTree::Node.new(9))

    expect(root.validate_bst?).to eq(true)
  end

  example "balanced tree that is not a bst with 10 nodes should return false" do
    root = ADT::BinaryTree::Node.new(5)
    root.insert_left(ADT::BinaryTree::Node.new(3))
    root.left.insert_left(ADT::BinaryTree::Node.new(1))
    root.left.left.insert_right(ADT::BinaryTree::Node.new(2))
    root.left.insert_right(ADT::BinaryTree::Node.new(4))

    root.insert_right(ADT::BinaryTree::Node.new(6))
    root.right.insert_left(ADT::BinaryTree::Node.new(7))
    root.right.left.insert_right(ADT::BinaryTree::Node.new(8))
    root.right.insert_right(ADT::BinaryTree::Node.new(9))
    root.right.right.insert_left(ADT::BinaryTree::Node.new(10))
    expect(root.validate_bst?).to eq(false)
  end

  example "almost (but not really) a bst" do
    root = ADT::BinaryTree::Node.new(5)
    root.insert_left(ADT::BinaryTree::Node.new(3))
    root.left.insert_left(ADT::BinaryTree::Node.new(1))
    root.left.insert_right(ADT::BinaryTree::Node.new(6))
    expect(root.validate_bst?).to eq(false)
  end

  example "also almost (but not really) a bst" do
    root = ADT::BinaryTree::Node.new(20)
    root.insert_left(ADT::BinaryTree::Node.new(10))
    root.insert_right(ADT::BinaryTree::Node.new(30))
    root.left.insert_left(ADT::BinaryTree::Node.new(5))
    root.left.insert_right(ADT::BinaryTree::Node.new(15))
    root.left.left.insert_left(ADT::BinaryTree::Node.new(3))
    root.left.left.insert_right(ADT::BinaryTree::Node.new(11))
    root.left.right.insert_right(ADT::BinaryTree::Node.new(17))
    expect(root.validate_bst?).to eq(false)
  end

  example "one more almost (but not really) a bst" do
    root = ADT::BinaryTree::Node.new(20)
    root.insert_left(ADT::BinaryTree::Node.new(10))
    root.insert_right(ADT::BinaryTree::Node.new(30))
    root.left.insert_left(ADT::BinaryTree::Node.new(5))
    root.left.insert_right(ADT::BinaryTree::Node.new(15))
    root.left.left.insert_left(ADT::BinaryTree::Node.new(3))
    root.left.left.insert_right(ADT::BinaryTree::Node.new(7))
    root.left.right.insert_right(ADT::BinaryTree::Node.new(17))
    root.right.insert_left(ADT::BinaryTree::Node.new(19))
    expect(root.validate_bst?).to eq(false)
  end

  example "now we have a bst" do
    root = ADT::BinaryTree::Node.new(20)
    root.insert_left(ADT::BinaryTree::Node.new(10))
    root.insert_right(ADT::BinaryTree::Node.new(30))
    root.left.insert_left(ADT::BinaryTree::Node.new(5))
    root.left.insert_right(ADT::BinaryTree::Node.new(15))
    root.left.left.insert_left(ADT::BinaryTree::Node.new(3))
    root.left.left.insert_right(ADT::BinaryTree::Node.new(7))
    root.left.right.insert_right(ADT::BinaryTree::Node.new(17))
    expect(root.validate_bst?).to eq(true)
  end

end
