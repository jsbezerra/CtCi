require 'rspec'
require 'chapter4/trees'

describe 'TreeNode#validate_bst?' do

  example 'degenerate right tree that should be a bst' do
    pending 'not implemented yet'
    root = ADT::Tree::TreeNode.new(1)
    n = root
    (2..5).each do |i|
      node = ADT::Tree::TreeNode.new(i)
      n.insert_right(node)
      n = node
    end
    expect(root.validate_bst?).to eq(true)
  end

  example 'degenerate right tree that should not be a bst' do
    pending 'not implemented yet'
    root = ADT::Tree::TreeNode.new(1)
    n = root
    (2..5).each do |i|
      node = ADT::Tree::TreeNode.new(-i)
      n.insert_right(node)
      n = node
    end
    expect(root.validate_bst?).to eq(false)
  end

  example "balanced bst with 10 nodes should return true" do
    pending 'not implemented yet'
    root = ADT::Tree::TreeNode.new(5)
    root.insert_left(ADT::Tree::TreeNode.new(3))
    root.left.insert_left(ADT::Tree::TreeNode.new(1))
    root.left.left.insert_right(ADT::Tree::TreeNode.new(2))
    root.left.insert_right(ADT::Tree::TreeNode.new(4))

    root.insert_right(ADT::Tree::TreeNode.new(8))
    root.right.insert_left(ADT::Tree::TreeNode.new(6))
    root.right.left.insert_right(ADT::Tree::TreeNode.new(7))
    root.right.insert_right(ADT::Tree::TreeNode.new(10))
    root.right.right.insert_left(ADT::Tree::TreeNode.new(9))

    expect(root.validate_bst?).to eq(true)
  end

  example "balanced tree that is not a bst with 10 nodes should return false" do
    pending 'not implemented yet'
    root = ADT::Tree::TreeNode.new(5)
    root.insert_left(ADT::Tree::TreeNode.new(3))
    root.left.insert_left(ADT::Tree::TreeNode.new(1))
    root.left.left.insert_right(ADT::Tree::TreeNode.new(2))
    root.left.insert_right(ADT::Tree::TreeNode.new(4))

    root.insert_right(ADT::Tree::TreeNode.new(6))
    root.right.insert_left(ADT::Tree::TreeNode.new(7))
    root.right.left.insert_right(ADT::Tree::TreeNode.new(8))
    root.right.insert_right(ADT::Tree::TreeNode.new(9))
    root.right.right.insert_left(ADT::Tree::TreeNode.new(10))
    expect(root.validate_bst?).to eq(false)
  end

end
