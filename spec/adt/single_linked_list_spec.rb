require 'rspec'
require 'adt/list'

describe 'SLList' do

  describe '#new' do
    it 'creates an empty list' do
      list = ADT::List::SLList.new
      expect(list.size).to eq(0)
      expect(list.empty?).to eq(true)
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
    context 'when the element exists on the list' do
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

    context 'when removing an element from an empty list' do
      it 'returns nil' do
        list = ADT::List::SLList.new
        expect(list.delete(7)).to be_nil
        expect(list.size).to eq(0)
      end

      it 'does not change the size of the list' do
        list = ADT::List::SLList.new
        expect(list.size).to eq(0)
        expect(list.empty?).to eq(true)
      end
    end

    context 'when removing an element that is not on the list' do
      it 'does not remove any element' do
        list = ADT::List::SLList.create_from_array [5, 4, 3, 2, 3]

        list.delete(7)

        arr = list.to_a
        expect(arr).to eq([5, 4, 3, 2, 3])
      end

      it 'does not change the list size' do
        list = ADT::List::SLList.create_from_array [5, 4, 3, 2, 3]
        expect(list.size).to eq(5)

        list.delete(7)
        expect(list.size).to eq(5)
      end
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
    example 'should return true on an empty list' do
      list = ADT::List::SLList.new
      expect(list.empty?).to eq(true)
    end

    example 'should return false on a non-empty list' do
      list = ADT::List::SLList.create_from_array [5, 4]
      expect(list.empty?).to eq(false)
    end
  end

  describe '#add_to_head' do
    it 'adds a given data at the beginning of the list' do
      list = ADT::List::SLList.create_from_array [5, 4, 3, 2, 3]
      list.add_to_head(1)
      arr = list.to_a
      expect(arr).to eq([1, 5, 4, 3, 2, 3])
    end

    it 'increases the list size' do
      list = ADT::List::SLList.create_from_array [5, 4, 3, 2, 3]
      expect(list.size).to eq(5)
      list.add_to_head(1)
      expect(list.size).to eq(6)
    end
  end

  describe '#merge!' do
    context 'when merging two empty lists' do
      it 'returns an empty list' do
        list1 = ADT::List::SLList.new
        list2 = ADT::List::SLList.new
        list1.merge! list2
        expect(list1.empty?).to eq(true)
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

  context 'removing the last element on the list' do
    example 'when the list has a single element' do
      list = ADT::List::SLList.create_from_array [5]
      list.delete(5)
      list.add(2)
      expect(list.to_a).to eq([2])
    end

    example 'when the list has several elements' do
      list = ADT::List::SLList.create_from_array [5, 4, 3, 2, 1]
      expect(list.size).to eq(5)

      list.delete(1)
      expect(list.size).to eq(4)
      list.add(7)
      expect(list.to_a).to eq([5, 4, 3, 2, 7])
    end
  end

  context 'special cases' do
    example "remove the head of the list should work" do
      list = ADT::List::SLList.create_from_array [5, 4, 3, 2, 1]
      expect(list.size).to eq(5)

      list.delete(5)
      expect(list.size).to eq(4)
      expect(list.to_a).to eq([4,3,2,1])
    end
  end
end