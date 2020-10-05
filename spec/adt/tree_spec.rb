require 'rspec'
require 'adt/tree'

describe 'TreeNode' do
  context '#new' do
    it 'creates a new tree node' do
      root = ADT::Tree::TreeNode.new(5)
      expect(root.data).to eq(5)
      expect(root.left).to be_nil
      expect(root.right).to be_nil
    end
  end

  context '#insert_left' do
    it 'inserts a node on the left if it does not exist' do
      root = ADT::Tree::TreeNode.new(5)
      expect(root.data).to eq(5)
      expect(root.left).to be_nil
      expect(root.right).to be_nil

      root.insert_left(ADT::Tree::TreeNode.new(3))
      expect(root.data).to eq(5)
      expect(root.left.data).to eq(3)
      expect(root.right).to be_nil
    end
  end

  context '#insert_right' do
    it 'inserts a node on the right if it does not exist' do
      root = ADT::Tree::TreeNode.new(5)
      expect(root.data).to eq(5)
      expect(root.left).to be_nil
      expect(root.right).to be_nil

      root.insert_right(ADT::Tree::TreeNode.new(8))
      expect(root.data).to eq(5)
      expect(root.left).to be_nil
      expect(root.right.data).to eq(8)
    end
  end

  example "#arr should return the array using in-order" do
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

    expect(root.arr).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
  end
end