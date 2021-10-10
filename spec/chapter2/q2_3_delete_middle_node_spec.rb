# frozen_string_literal: true

require "rspec"
require "chapter2/linked_lists"

describe "SLNode#delete_middle_node!" do
  context "given a list {a, b, c, d, e, f} and the node with c" do
    it "changes the list to {a, b, d, e, f}" do
      list = ADT::SingleLinkedList.create_from_array %w[a b c d e f]
      nodes = list.get_nodes
      nodes[2].delete_middle_node!
      expect(list.to_a).to eq(%w[a b d e f])
    end
  end

  context "given a list {a, b, c, d, e, f} and the node with d" do
    it "changes the list to {a, b, d, e, f}" do
      list = ADT::SingleLinkedList.create_from_array %w[a b c d e f]
      nodes = list.get_nodes
      nodes[3].delete_middle_node!
      expect(list.to_a).to eq(%w[a b c e f])
    end
  end

  context "given a list {1, 5, 9, 12} and the node with 9" do
    it "changes the list to {1, 5, 12}" do
      list = ADT::SingleLinkedList.create_from_array [1, 5, 9, 12]
      nodes = list.get_nodes
      nodes[2].delete_middle_node!
      expect(list.to_a).to eq([1, 5, 12])
    end
  end
end
