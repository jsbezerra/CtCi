# frozen_string_literal: true

require "rspec"
require "chapter4/trees"

describe "Node#bst_sequence" do
  example "tree 2(1,2) should return {{2,1,3},{2,3,1}}" do
    root = ADT::BinaryTree::Node.new 2
    n1 = ADT::BinaryTree::Node.new 1
    n3 = ADT::BinaryTree::Node.new 3
    root.insert_left n1
    root.insert_right n3
    result = root.bst_sequence
    expect(result.size).to eq(2)
    arrays = result.map(&:to_a)
    expect(arrays).to match_array([[2, 1, 3], [2, 3, 1]])
  end
end
