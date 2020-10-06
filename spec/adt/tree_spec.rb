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

  context '#height' do
    example "tree with only one node should have height 0" do
      root = ADT::Tree::TreeNode.new(5)
      expect(root.height).to eq(0)
    end

    example "balanced tree with 10 nodes should have height 3" do
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

      expect(root.height).to eq(3)
    end

    example 'degenerate right tree with 5 nodes should have height 4' do
      root = ADT::Tree::TreeNode.new(1)
      n = root
      (2..5).each do |i|
        node = ADT::Tree::TreeNode.new(i)
        n.insert_right(node)
        n = node
      end
      expect(root.height).to eq(4)
    end

    example 'degenerate tree with 10 nodes should have height 9' do
      root = ADT::Tree::TreeNode.new(1)
      n = root
      (2..10).each do |i|
        node = ADT::Tree::TreeNode.new(i)
        if i % 2 == 0
          n.insert_right(node)
        else
          n.insert_left(node)
        end
        n = node
      end
      expect(root.height).to eq(9)
    end

    example 'unbalanced tree which should have height 9' do
      root = ADT::Tree::TreeNode.new(1)
      n = root
      (2..10).each do |i|
        node = ADT::Tree::TreeNode.new(i)
        if i % 2 == 0
          n.insert_right(node)
        else
          n.insert_left(node)
        end
        n = node
      end
      root.right.insert_right(ADT::Tree::TreeNode.new(20))
      root.right.right.insert_right(ADT::Tree::TreeNode.new(30))
      root.right.right.right.insert_right(ADT::Tree::TreeNode.new(40))
      expect(root.height).to eq(9)
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

    expect(root.to_in_order_a).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
  end
end