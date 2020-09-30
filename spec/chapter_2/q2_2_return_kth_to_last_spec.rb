require 'rspec'
require 'adt/list'

describe 'SLList#return_kth_to_last' do

  context 'given a list {1, 2, 3, 4, 5} and k = 1' do
    it 'returns 5' do
      pending
      list = ADT::List::SLList.create_from_array [1, 2, 3, 4, 5]
      expect(list.return_kth_to_last(1)).to eq(5)
    end
  end

  context 'given a list {1, 2, 3, 4, 5} and k = 3' do
    it 'returns 3' do
      pending
      list = ADT::List::SLList.create_from_array [1, 2, 3, 4, 5]
      expect(list.return_kth_to_last(1)).to eq(5)
    end
  end

  context 'given a list {1, 2, 3, 4, 5} and k = 5' do
    it 'returns 1' do
      pending
      list = ADT::List::SLList.create_from_array [1, 2, 3, 4, 5]
      expect(list.return_kth_to_last(1)).to eq(5)
    end
  end

  context 'given a list {1, 2, 3, 4, 5} and k = 8' do
    it 'returns nil' do
      pending
      list = ADT::List::SLList.create_from_array [1, 2, 3, 4, 5]
      expect(list.return_kth_to_last(1)).to be_nil
    end
  end
end