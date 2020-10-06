require 'rspec'
require 'adt/binary_tree'

describe 'TreeNode' do

  def balanced_tree_10_nodes
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
    root
  end

  context '#new' do
    it 'creates a new tree node' do
      root = ADT::BinaryTree::Node.new(5)
      expect(root.data).to eq(5)
      expect(root.left).to be_nil
      expect(root.right).to be_nil
    end

    it 'creates a tree with size 1' do
      root = ADT::BinaryTree::Node.new(5)
      expect(root.size).to eq(1)
    end

    it 'creates a node without parent' do
      root = ADT::BinaryTree::Node.new(5)
      expect(root.parent).to be_nil
    end
  end

  context '#insert_left' do
    it 'inserts a node on the left if it does not exist' do
      root = ADT::BinaryTree::Node.new(5)
      expect(root.data).to eq(5)
      expect(root.left).to be_nil
      expect(root.right).to be_nil

      root.insert_left(ADT::BinaryTree::Node.new(3))
      expect(root.data).to eq(5)
      expect(root.left.data).to eq(3)
      expect(root.right).to be_nil
    end

    it 'replaces a node on the left (and its entire subtree) if it exists' do
      root = ADT::BinaryTree::Node.new(5)
      expect(root.data).to eq(5)
      expect(root.left).to be_nil
      expect(root.right).to be_nil

      root.insert_left(ADT::BinaryTree::Node.new(3))
      expect(root.data).to eq(5)
      expect(root.left.data).to eq(3)
      expect(root.right).to be_nil

      root.insert_left(ADT::BinaryTree::Node.new(7))
      expect(root.data).to eq(5)
      expect(root.left.data).to eq(7)
      expect(root.right).to be_nil
    end

    it 'updates parents references' do
      root = ADT::BinaryTree::Node.new(5)
      expect(root.parent).to be_nil

      left = ADT::BinaryTree::Node.new(3)
      expect(left.parent).to be_nil

      root.insert_left(left)
      expect(root.parent).to be_nil
      expect(left.parent).to eq(root)
    end
  end

  context '#insert_right' do
    it 'inserts a node on the right if it does not exist' do
      root = ADT::BinaryTree::Node.new(5)
      expect(root.data).to eq(5)
      expect(root.left).to be_nil
      expect(root.right).to be_nil

      root.insert_right(ADT::BinaryTree::Node.new(8))
      expect(root.data).to eq(5)
      expect(root.left).to be_nil
      expect(root.right.data).to eq(8)
    end

    it 'replaces a node on the right if it does not exist' do
      root = ADT::BinaryTree::Node.new(5)
      expect(root.data).to eq(5)
      expect(root.left).to be_nil
      expect(root.right).to be_nil

      root.insert_right(ADT::BinaryTree::Node.new(8))
      expect(root.data).to eq(5)
      expect(root.left).to be_nil
      expect(root.right.data).to eq(8)

      root.insert_right(ADT::BinaryTree::Node.new(20))
      expect(root.data).to eq(5)
      expect(root.left).to be_nil
      expect(root.right.data).to eq(20)
    end

    it 'updates parents references' do
      root = ADT::BinaryTree::Node.new(5)
      expect(root.parent).to be_nil

      right = ADT::BinaryTree::Node.new(8)
      expect(right.parent).to be_nil

      root.insert_right(right)
      expect(root.parent).to be_nil
      expect(right.parent).to eq(root)
    end
  end

  context '#size returns the number of the nodes in the tree' do
    example 'tree with size 2' do
      root = ADT::BinaryTree::Node.new(5)
      root.insert_right(ADT::BinaryTree::Node.new(8))
      expect(root.size).to eq(2)
    end

    example 'tree with size 10' do
      root = balanced_tree_10_nodes

      expect(root.size).to eq(10)
    end

    example 'tree with size 5' do
      root = ADT::BinaryTree::Node.new(1)
      n = root
      (2..5).each do |i|
        node = ADT::BinaryTree::Node.new(i)
        n.insert_right(node)
        n = node
      end
      expect(root.size).to eq(5)
    end
  end

  context '#height' do
    example "tree with only one node should have height 0" do
      root = ADT::BinaryTree::Node.new(5)
      expect(root.height).to eq(0)
    end

    example "balanced tree with 10 nodes should have height 3" do
      root = balanced_tree_10_nodes

      expect(root.height).to eq(3)
    end

    example 'degenerate right tree with 5 nodes should have height 4' do
      root = ADT::BinaryTree::Node.new(1)
      n = root
      (2..5).each do |i|
        node = ADT::BinaryTree::Node.new(i)
        n.insert_right(node)
        n = node
      end
      expect(root.height).to eq(4)
    end

    example 'degenerate tree with 10 nodes should have height 9' do
      root = ADT::BinaryTree::Node.new(1)
      n = root
      (2..10).each do |i|
        node = ADT::BinaryTree::Node.new(i)
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
      root = ADT::BinaryTree::Node.new(1)
      n = root
      (2..10).each do |i|
        node = ADT::BinaryTree::Node.new(i)
        if i % 2 == 0
          n.insert_right(node)
        else
          n.insert_left(node)
        end
        n = node
      end
      root.right.insert_right(ADT::BinaryTree::Node.new(20))
      root.right.right.insert_right(ADT::BinaryTree::Node.new(30))
      root.right.right.right.insert_right(ADT::BinaryTree::Node.new(40))
      expect(root.height).to eq(9)
    end
  end

  example "#arr should return the array using in-order" do
    root = balanced_tree_10_nodes
    expect(root.to_in_order_a).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
  end

  example "references to parents should be correct" do
    root = balanced_tree_10_nodes
    expect(root.parent).to be_nil

    expect(root.left.parent).to be(root)
    expect(root.right.parent).to be(root)

    expect(root.left.left.parent).to be(root.left)
    expect(root.left.right.parent).to be(root.left)

    expect(root.right.left.parent).to be(root.right)
    expect(root.right.right.parent).to be(root.right)

    expect(root.left.left.right.parent).to be(root.left.left)
    expect(root.right.left.right.parent).to be(root.right.left)
    expect(root.right.right.left.parent).to be(root.right.right)
  end
end