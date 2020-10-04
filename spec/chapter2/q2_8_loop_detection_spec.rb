require 'rspec'
require 'chapter2/linked_lists'

describe 'LinkedLists#loop_detection?' do
  example '{1,2,3,4,5,6,2} should return 2' do
    list = ADT::List::SLList.create_from_array [1, 2, 3, 4, 5, 6]
    nodes = list.get_nodes
    nodes[5].next = nodes[1]
    loop = list.loop_detection?

    expect(loop).not_to be_nil
    expect(loop).to eq(nodes[1])
    expect(loop.data).to eq(2)
  end

  example '{a,b,c,d,e,c} should return c' do
    list = ADT::List::SLList.create_from_array %w{a b c d e}
    nodes = list.get_nodes
    nodes[4].next = nodes[2]
    loop = list.loop_detection?

    expect(loop).not_to be_nil
    expect(loop).to eq(nodes[2])
    expect(loop.data).to eq("c")
  end

  example '{a,b,c,d,e} should return nil' do
    list = ADT::List::SLList.create_from_array %w{a b c d e}
    loop = list.loop_detection?

    expect(loop).to be_nil
  end

  example '{1,2,3,4,5,6} should return nil' do
    list = ADT::List::SLList.create_from_array [1, 2, 3, 4, 5, 6]
    loop = list.loop_detection?

    expect(loop).to be_nil
  end
end