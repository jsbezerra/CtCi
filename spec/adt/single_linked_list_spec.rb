require 'rspec'
require 'adt/list'

describe 'SingleLinkedList' do

  context 'when creating' do
    it 'creates an empty list' do
      list = ADT::List::SLList.new
      expect(list.size).to eq(0)
    end
  end

  context 'when adding an element' do
    it 'increases the list size' do
      list = ADT::List::SLList.new
      expect(list.size).to eq(0)
      list.add(1)
      expect(list.size).to eq(1)
      list.add(3)
      expect(list.size).to eq(2)
    end

    it 'appends elements to the end of the list' do
      list = ADT::List::SLList.new
      list.add(5)
      list.add(4)
      list.add(3)
      list.add(2)
      list.add(3)
      arr = list.inject([]) { |arr, node|
        arr << node.data
      }
      expect(arr).to eq([5,4,3,2,3])
    end
  end

  context 'when deleting an element' do
  
    it 'removes only the first occurrence of that element' do
      list = ADT::List::SLList.new
      list.add(5)
      list.add(4)
      list.add(3)
      list.add(2)
      list.add(3)
      expect(list.size).to eq(5)

      list.delete(3)
      expect(list.size).to eq(4)

      arr = list.inject([]) { |arr, node|
        arr << node.data
      }
      expect(arr).to eq([5,4,2,3])
    end
  end
end