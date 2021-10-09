# frozen_string_literal: true

module BinaryTreeHelper
  def balanced_bst_10_nodes
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
end
