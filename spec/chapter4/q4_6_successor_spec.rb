require 'rspec'
require 'chapter4/trees'
require 'support/binary_tree_helper'

describe 'Node#successor' do

  include BinaryTreeHelper

  context 'given a balanced bst with 10 nodes' do

    before(:context) do
      @root = balanced_bst_10_nodes
      @nodes = @root.in_order_nodes
    end

    example "successor of 1 should be 2" do
      expect(@nodes[0].successor).to be(@nodes[1])
    end

    example "successor of 2 should be 3" do
      expect(@nodes[1].successor).to be(@nodes[2])
    end

    example "successor of 3 should be 4" do
      expect(@nodes[2].successor).to be(@nodes[3])
    end

    example "successor of 4 should be 5" do
      expect(@nodes[3].successor).to be(@nodes[4])
    end

    example "successor of 5 should be 6" do
      expect(@nodes[4].successor).to be(@nodes[5])
    end

    example "successor of 6 should be 7" do
      expect(@nodes[5].successor).to be(@nodes[6])
    end

    example "successor of 7 should be 8" do
      expect(@nodes[6].successor).to be(@nodes[7])
    end

    example "successor of 8 should be 9" do
      expect(@nodes[7].successor).to be(@nodes[8])
    end

    example "successor of 9 should be 10" do
      expect(@nodes[8].successor).to be(@nodes[9])
    end

    example "successor of 10 should be nil" do
      expect(@nodes[9].successor).to be_nil
    end
  end
end