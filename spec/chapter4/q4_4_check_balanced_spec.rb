require 'rspec'
require 'chapter4/trees'

describe 'Tree#check_balanced?' do

  example 'tree with one node only should return true' do
    pending 'not implemented yet'
    root = ADT::Tree::TreeNode.new(5)
    expect(root.check_balanced?).to be_truthy
  end

  example 'tree with only two nodes should return true' do
    pending 'not implemented yet'
    root = ADT::Tree::TreeNode.new(5)
    root.insert_left(ADT::Tree::TreeNode.new(2))
    expect(root.check_balanced?).to be_truthy
  end

  example 'degenerate left tree with 3 nodes should return false' do
    pending 'not implemented yet'
    root = ADT::Tree::TreeNode.new(1)
    n = root
    (2..3).each do |i|
      node = ADT::Tree::TreeNode.new(i)
      n.insert_left(node)
      n = node
    end
    expect(root.check_balanced?).to be_falsey
  end

  example 'degenerate right tree with 5 nodes should return false' do
    pending 'not implemented yet'
    root = ADT::Tree::TreeNode.new(1)
    n = root
    (2..5).each do |i|
      node = ADT::Tree::TreeNode.new(i)
      n.insert_right(node)
      n = node
    end
    expect(root.check_balanced?).to be_falsey
  end

  example "balanced tree with 10 nodes should return true" do
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

    expect(root.check_balanced?).to be_truthy
  end
end
