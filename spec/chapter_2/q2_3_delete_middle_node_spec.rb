require 'rspec'
require 'adt/list'

describe 'SLList#delete_middle_node!' do
  context 'given a list {a, b, c, d, e, f} and the node with c' do
    it 'it changes the list to {a, b, d, e, f}' do
      pending 'Not implemented yet'
      list = ADT::List::SLList.create_from_array %w{a b c d e f}
      nodes = list.get_nodes
      nodes[2].delete_middle_node!
      expect(list.to_a).to eq(%w{a b d e f})
    end
  end

  context 'given a list {a, b, c, d, e, f} and the node with f' do
    it 'it changes the list to {a, b, c, d, e}' do
      pending 'Not implemented yet'
      list = ADT::List::SLList.create_from_array %w{a b c d e f}
      nodes = list.get_nodes
      nodes[5].delete_middle_node!
      expect(list.to_a).to eq(%w{a b c d e})
    end
  end

  context 'given a list {1, 5, 9, 12} and the node with 9' do
    it 'it changes the list to {1, 5, 12}' do
      pending 'Not implemented yet'
      list = ADT::List::SLList.create_from_array [1, 5, 9, 12]
      nodes = list.get_nodes
      nodes[2].delete_middle_node!
      expect(list.to_a).to eq([1, 5, 12])
    end
  end
end