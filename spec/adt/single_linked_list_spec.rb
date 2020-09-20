require 'rspec'
require 'adt/list'

describe 'SingleLinkedList' do

  def create_list(values = [])
    @list = ADT::List::SLList.new
    values.each do |v|
      @list.add(v)
    end
  end

  context 'when creating' do
    it 'creates an empty list' do
      create_list
      expect(@list.size).to eq(0)
    end
  end

  context 'when adding an element' do
    it 'increases the list size' do
      create_list
      expect(@list.size).to eq(0)
      @list.add(1)
      expect(@list.size).to eq(1)
      @list.add(3)
      expect(@list.size).to eq(2)
    end

    it 'appends each element to the end of the list in the order they are given' do
      create_list [5,4,3,2,3]
      arr = @list.inject([]) { |arr, node|
        arr << node.data
      }
      expect(arr).to eq([5,4,3,2,3])
    end
  end

  context 'when deleting an element' do
  
    it 'removes only the first occurrence of that element' do
      create_list [5,4,3,2,3]
      expect(@list.size).to eq(5)

      @list.delete(3)
      expect(@list.size).to eq(4)

      arr = @list.inject([]) { |arr, node|
        arr << node.data
      }
      expect(arr).to eq([5,4,2,3])
    end
  end
end