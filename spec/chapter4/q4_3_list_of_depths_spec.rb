# frozen_string_literal: true

require "rspec"
require "adt/list"
require "adt/binary_tree"
require "chapter4/trees"

describe "TreeNode#list_of_depths" do
  context "when given a left degenerate tree 1 -> 2 -> 3 -> 4 -> 5" do
    it "returns 5 lists of size 1" do
      root = ADT::BinaryTree::Node.new(1)
      n = root
      (2..5).each do |i|
        node = ADT::BinaryTree::Node.new(i)
        n.insert_left(node)
        n = node
      end

      lists = root.list_of_depths
      expect(lists.size).to eq(5)
      lists.each do |list|
        expect(list.size).to eq(1)
      end
    end
  end

  context "when given a right degenerate tree 1 -> 2 -> 3 -> 4 -> 5" do
    it "returns 5 lists of size 1" do
      root = ADT::BinaryTree::Node.new(1)
      n = root
      (2..5).each do |i|
        node = ADT::BinaryTree::Node.new(i)
        n.insert_right(node)
        n = node
      end

      lists = root.list_of_depths
      expect(lists.size).to eq(5)
      lists.each do |list|
        expect(list.size).to eq(1)
      end
    end
  end

  context "when given an ordinary tree" do
    it "succeeds" do
      n1 = ADT::BinaryTree::Node.new(1)
      n2 = ADT::BinaryTree::Node.new(2)
      n3 = ADT::BinaryTree::Node.new(3)
      n4 = ADT::BinaryTree::Node.new(4)
      n5 = ADT::BinaryTree::Node.new(5)
      n6 = ADT::BinaryTree::Node.new(6)
      n7 = ADT::BinaryTree::Node.new(7)
      n8 = ADT::BinaryTree::Node.new(8)
      n9 = ADT::BinaryTree::Node.new(9)
      n10 = ADT::BinaryTree::Node.new(10)

      n1.insert_left(n2)
      n1.insert_right(n3)

      n2.insert_left(n4)
      n2.insert_right(n5)

      n3.insert_left(n6)
      n3.insert_right(n7)

      n4.insert_left(n8)

      n6.insert_right(n9)

      n9.insert_right(n10)

      lists = n1.list_of_depths
      expect(lists.size).to eq(5)
      expect(lists[0].size).to eq(1)
      expect(lists[1].size).to eq(2)
      expect(lists[2].size).to eq(4)
      expect(lists[3].size).to eq(2)
      expect(lists[4].size).to eq(1)
    end
  end
end
