# frozen_string_literal: true

require "rspec"
require "chapter2/linked_lists"

describe "SingleLinkedList#return_kth_to_last" do
  context "given a list {1, 2, 3, 4, 5} and k = 1" do
    it "returns 5" do
      list = ADT::SingleLinkedList.create_from_array [1, 2, 3, 4, 5]
      expect(list.return_kth_to_last(1)).to eq(5)
    end
  end

  context "given a list {1, 2, 3, 4, 5} and k = 3" do
    it "returns 3" do
      list = ADT::SingleLinkedList.create_from_array [1, 2, 3, 4, 5]
      expect(list.return_kth_to_last(3)).to eq(3)
    end
  end

  context "given a list {1, 2, 3, 4, 5} and k = 5" do
    it "returns 1" do
      list = ADT::SingleLinkedList.create_from_array [1, 2, 3, 4, 5]
      expect(list.return_kth_to_last(5)).to eq(1)
    end
  end

  context "given a list {1, 2, 3, 4, 5} and k = 6" do
    it "returns nil" do
      list = ADT::SingleLinkedList.create_from_array [1, 2, 3, 4, 5]
      expect(list.return_kth_to_last(6)).to be_nil
    end
  end
end
