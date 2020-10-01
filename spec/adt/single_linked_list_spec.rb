require 'rspec'
require 'adt/list'

describe 'SLList' do

  describe '#new' do
    it 'creates an empty list' do
      list = ADT::List::SLList.new
      expect(list.size).to eq(0)
    end
  end

  describe '#add' do
    it 'increases the list size' do
      list = ADT::List::SLList.new
      expect(list.size).to eq(0)
      list.add(1)
      expect(list.size).to eq(1)
      list.add(3)
      expect(list.size).to eq(2)
    end

    it 'appends each element to the end of the list in the order they are given' do
      list = ADT::List::SLList.create_from_array [5, 4, 3, 2, 3]
      arr = list.to_a
      expect(arr).to eq([5, 4, 3, 2, 3])
    end
  end

  describe '#delete' do

    it 'removes only the first occurrence of that element' do
      list = ADT::List::SLList.create_from_array [5, 4, 3, 2, 3]

      list.delete(3)

      arr = list.to_a
      expect(arr).to eq([5, 4, 2, 3])
    end

    it 'decreases the list size' do
      list = ADT::List::SLList.create_from_array [5, 4, 3, 2, 3]
      expect(list.size).to eq(5)

      list.delete(3)
      expect(list.size).to eq(4)
    end
  end

  describe 'create_from_array' do
    context 'when creating from an array [5, 4, 3, 2, 1]' do
      it 'returns a list equal to {5, 4, 3, 2, 1}' do
        list = ADT::List::SLList.create_from_array [5, 4, 3, 2, 1]
        expect(list.size).to eq(5)
        expect(list.to_a).to eq([5, 4, 3, 2, 1])
      end
    end

    example "the sum of a list {5, 4} should be 9" do
      list = ADT::List::SLList.create_from_array [5, 4]
      sum = list.reduce(0) do |acc, v|
        acc + v
      end
      expect(sum).to eq(9)
    end
  end
end