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

  describe '#create_from_array' do
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

  describe '#empty?' do
    context 'given an empty list' do
      it 'returns true' do
        list = ADT::List::SLList.new
        expect(list.empty?).to be_truthy
      end
    end

    context 'give a non-empty list' do
      it 'returns false' do
        list = ADT::List::SLList.create_from_array [5, 4]
        expect(list.empty?).to be_falsey
      end
    end
  end

  describe '#merge!' do
    context 'when merging two empty lists' do
      it 'returns an empty list' do
        list1 = ADT::List::SLList.new
        list2 = ADT::List::SLList.new
        list1.merge! list2
        expect(list1.empty?).to be_truthy
      end
    end

    context 'when merging a non-empty list to an empty list' do

      before do
        @list1 = ADT::List::SLList.new
        @list2 = ADT::List::SLList.create_from_array [6, 7, 8, 9, 10]
      end

      it 'returns the non-empty list' do
        @list1.merge! @list2
        expect(@list1.to_a).to eq([6, 7, 8, 9, 10])
      end

      it 'keeps the size of the non-empty list' do
        @list1.merge! @list2
        expect(@list1.size).to eq(@list2.size)
      end
    end

    context 'when merging an empty list to a non-empty list' do

      before do
        @list1 = ADT::List::SLList.create_from_array [1, 2, 3, 4]
        @list2 = ADT::List::SLList.new
      end

      it 'returns the non-empty list' do
        @list1.merge! @list2
        expect(@list1.to_a).to eq([1, 2, 3, 4])
      end

      it 'keeps the size of the non-empty list' do
        @list1.merge! @list2
        expect(@list1.size).to eq(4)
      end
    end

    context 'when merging two non-empty lists' do

      before do
        @list1 = ADT::List::SLList.create_from_array [1, 2, 3, 4, 5]
        @list2 = ADT::List::SLList.create_from_array [6, 7, 8, 9, 10]
      end

      it 'returns a list with the elements of both lists' do
        @list1.merge! @list2
        expect(@list1.to_a).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
      end

      it 'has size equal to sum of both lists size' do
        @list1.merge! @list2
        expect(@list1.size).to eq(10)
      end
    end
  end
end