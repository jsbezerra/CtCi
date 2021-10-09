# frozen_string_literal: true

require "rspec"
require "chapter2/linked_lists"

describe "LinkedLists#loop_detection?" do
  example "{1,2,3,4,5,6,2} should return 2" do
    list = ADT::SingleLinkedList.create_from_array [1, 2, 3, 4, 5, 6]
    nodes = list.get_nodes
    nodes[5].next = nodes[1]
    loop = list.loop_detection?

    expect(loop).not_to be_nil
    expect(loop).to eq(nodes[1])
    expect(loop.data).to eq(2)
  end

  example "{a,b,c,d,e,c} should return c" do
    list = ADT::SingleLinkedList.create_from_array %w[a b c d e]
    nodes = list.get_nodes
    nodes[4].next = nodes[2]
    loop = list.loop_detection?

    expect(loop).not_to be_nil
    expect(loop).to eq(nodes[2])
    expect(loop.data).to eq("c")
  end

  example "{a,b,c,d,e} should return nil" do
    list = ADT::SingleLinkedList.create_from_array %w[a b c d e]
    loop = list.loop_detection?

    expect(loop).to be_nil
  end

  example "{1,2,3,4,5,6} should return nil" do
    list = ADT::SingleLinkedList.create_from_array [1, 2, 3, 4, 5, 6]
    loop = list.loop_detection?

    expect(loop).to be_nil
  end

  example "{0,1,2,3,4,5,6,7,3} should return 3" do
    list = ADT::SingleLinkedList.create_from_array [0, 1, 2, 3, 4, 5, 6, 7, 3]
    nodes = list.get_nodes
    nodes[7].next = nodes[3]
    loop = list.loop_detection?

    expect(loop).not_to be_nil
    expect(loop).to eq(nodes[3])
    expect(loop.data).to eq(3)
  end
end

describe "LinkedLists#loop_detection_b?" do
  example "{1,2,3,4,5,6,2} should return 2" do
    list = ADT::SingleLinkedList.create_from_array [1, 2, 3, 4, 5, 6]
    nodes = list.get_nodes
    nodes[5].next = nodes[1]
    loop = list.loop_detection_b?

    expect(loop).not_to be_nil
    expect(loop).to eq(nodes[1])
    expect(loop.data).to eq(2)
  end

  example "{a,b,c,d,e,c} should return c" do
    list = ADT::SingleLinkedList.create_from_array %w[a b c d e]
    nodes = list.get_nodes
    nodes[4].next = nodes[2]
    loop = list.loop_detection_b?

    expect(loop).not_to be_nil
    expect(loop).to eq(nodes[2])
    expect(loop.data).to eq("c")
  end

  example "{a,b,c,d,e} should return nil" do
    list = ADT::SingleLinkedList.create_from_array %w[a b c d e]
    loop = list.loop_detection_b?

    expect(loop).to be_nil
  end

  example "{1,2,3,4,5,6} should return nil" do
    list = ADT::SingleLinkedList.create_from_array [1, 2, 3, 4, 5, 6]
    loop = list.loop_detection_b?

    expect(loop).to be_nil
  end

  example "{0,1,2,3,4,5,6,7,3} should return 3" do
    list = ADT::SingleLinkedList.create_from_array [0, 1, 2, 3, 4, 5, 6, 7, 3]
    nodes = list.get_nodes
    nodes[7].next = nodes[3]
    loop = list.loop_detection_b?

    expect(loop).not_to be_nil
    expect(loop).to eq(nodes[3])
    expect(loop.data).to eq(3)
  end
end
