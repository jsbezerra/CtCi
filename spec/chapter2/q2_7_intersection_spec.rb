require 'rspec'
require 'chapter2/linked_lists'

describe 'LinkedLists#intersection?' do

  example '{1,2,3,4,5,6} and {7,4,5,6} should intersect' do
    list1 = ADT::List::SLList.create_from_array [1, 2, 3, 4, 5, 6]
    nodes = list1.get_nodes
    n = ADT::List::SLNode.new(7)
    n.next = nodes[3]
    list2 = ADT::List::SLList.new
    list2.new_head!(n)

    intersection = Chapter2::LinkedLists.intersect?(list1, list2)
    expect(intersection).not_to be_nil
    expect(intersection).to eq(nodes[3])
  end

  example "{1,2,3,4,5,6} and {7,4',5',6'} should not intersect" do
    list1 = ADT::List::SLList.create_from_array [1, 2, 3, 4, 5, 6]
    list2 = ADT::List::SLList.create_from_array [4, 5, 6]

    expect(Chapter2::LinkedLists.intersect?(list1, list2)).to be_nil
  end

  example '{7,4,5,6} and {1,2,3,4,5,6} should intersect' do
    list1 = ADT::List::SLList.create_from_array [1, 2, 3, 4, 5, 6]
    nodes = list1.get_nodes
    n = ADT::List::SLNode.new(7)
    n.next = nodes[3]
    list2 = ADT::List::SLList.new
    list2.new_head!(n)

    intersection = Chapter2::LinkedLists.intersect?(list2, list1)
    expect(intersection).not_to be_nil
    expect(intersection).to eq(nodes[3])
  end

  example "{7,4',5',6'} and {1,2,3,4,5,6} should not intersect" do
    list1 = ADT::List::SLList.create_from_array [1, 2, 3, 4, 5, 6]
    list2 = ADT::List::SLList.create_from_array [4, 5, 6]

    expect(Chapter2::LinkedLists.intersect?(list2, list1)).to be_nil
  end
end