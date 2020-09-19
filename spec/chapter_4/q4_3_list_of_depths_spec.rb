require 'rspec'
require 'adt/list'
require 'adt/tree'
require 'chapter_4/trees'

describe 'Q4_3_ListOfDepths' do

  context 'when given a left degenerate tree 1 -> 2 -> 3 -> 4 -> 5' do
    it 'returns 5 lists of size 1' do
      root = ADT::Tree::TreeNode.new(1)
      n = root
      (2..5).each do |i|
        node = ADT::Tree::TreeNode.new(i)
        n.insert_left(node)
        n = node
      end

      lists = Chapter4::Trees.list_of_depths(root)
      expect(lists.size).to eq(5)
      lists.each do |list|
        expect(list.size).to eq(1)
      end
    end
  end

  context 'when given a right degenerate tree 1 -> 2 -> 3 -> 4 -> 5' do
    it 'returns 5 lists of size 1' do
      root = ADT::Tree::TreeNode.new(1)
      n = root
      (2..5).each do |i|
        node = ADT::Tree::TreeNode.new(i)
        n.insert_right(node)
        n = node
      end

      lists = Chapter4::Trees.list_of_depths(root)
      expect(lists.size).to eq(5)
      lists.each do |list|
        expect(list.size).to eq(1)
      end
    end
  end

  context 'when given an ordinary tree' do
    it 'succeeds' do
      n1 = ADT::Tree::TreeNode.new(1)
      n2 = ADT::Tree::TreeNode.new(2)
      n3 = ADT::Tree::TreeNode.new(3)
      n4 = ADT::Tree::TreeNode.new(4)
      n5 = ADT::Tree::TreeNode.new(5)
      n6 = ADT::Tree::TreeNode.new(6)
      n7 = ADT::Tree::TreeNode.new(7)
      n8 = ADT::Tree::TreeNode.new(8)
      n9 = ADT::Tree::TreeNode.new(9)
      n10 = ADT::Tree::TreeNode.new(10)

      n1.insert_left(n2)
      n1.insert_right(n3)

      n2.insert_left(n4)
      n2.insert_right(n5)

      n3.insert_left(n6)
      n3.insert_right(n7)

      n4.insert_left(n8)

      n6.insert_right(n9)

      n9.insert_right(n10)

      lists = Chapter4::Trees.list_of_depths(n1)
      expect(lists.size).to eq(5)
      expect(lists[0].size).to eq(1)
      expect(lists[1].size).to eq(2)
      expect(lists[2].size).to eq(4)
      expect(lists[3].size).to eq(2)
      expect(lists[4].size).to eq(1)
    end
  end
end