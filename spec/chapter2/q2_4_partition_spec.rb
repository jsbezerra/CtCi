require 'rspec'
require 'chapter2/linked_lists'

describe 'SingleLinkedList#partition!' do
  context 'given a list {3, 5, 8, 5, 10, 2, 1} and x = 5' do
    it 'maintains the size of the list' do
      list = ADT::SingleLinkedList.create_from_array [3, 5, 8, 5, 10, 2, 1]
      expect(list.size).to eq(7)
      list.partition!(5)
      expect(list.size).to eq(7)
    end

    it 'keeps every element less than 5 five before it' do
      list = ADT::SingleLinkedList.create_from_array [3, 5, 8, 5, 10, 2, 1]
      list.partition!(5)
      array = list.to_a
      array.each_with_index do |v, i|
        if i < 3
          expect(v).to be < 5
        else
          expect(v).to be >= 5
        end
      end
    end

    it 'has the same elements as the original list' do
      list = ADT::SingleLinkedList.create_from_array [3, 5, 8, 5, 10, 2, 1]
      list.partition!(5)
      array = list.to_a
      expect(array.sort).to eq([1, 2, 3, 5, 5, 8, 10])
    end
  end
end