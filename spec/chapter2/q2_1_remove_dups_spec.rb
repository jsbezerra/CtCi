require 'rspec'
require 'chapter2/linked_lists'

describe 'SLList#remove_dups!' do

  context 'when given a list {1,1,1,1,1}' do
    it 'returns only {1}' do
      list = ADT::List::SLList.new
      5.times {
        list.add(1)
      }
      expect(list.size).to eq(5)
      expect(list.to_a).to eq([1, 1, 1, 1, 1])

      list.remove_dups!
      expect(list.size).to eq(1)
      expect(list.to_a).to eq([1])
    end
  end

  context 'when given a list with several 1s, 2s and 3s' do
    it 'returns only {1,2,3}' do
      list = ADT::List::SLList.new
      arr = []
      5.times {
        list.add(1)
        list.add(2)
        list.add(3)
        arr.append(1, 2, 3)
      }
      expect(list.size).to eq(15)
      expect(list.to_a).to eq(arr)

      list.remove_dups!
      expect(list.size).to eq(3)
      expect(list.to_a).to eq([1, 2, 3])
    end
  end

  context 'when given a list without repeated elements' do
    it 'returns the same list' do
      list = ADT::List::SLList.new
      arr = (1..20).to_a
      (1..20).each { |i|
        list.add(i)
      }
      expect(list.size).to eq(20)
      expect(list.to_a).to eq(arr)

      list.remove_dups!
      expect(list.size).to eq(20)
      expect(list.to_a).to eq(arr)
    end
  end
end

describe 'SLList#remove_dups_b!' do

  context 'when given a list {1,1,1,1,1}' do
    it 'returns only {1}' do
      list = ADT::List::SLList.new
      5.times {
        list.add(1)
      }
      expect(list.size).to eq(5)
      expect(list.to_a).to eq([1, 1, 1, 1, 1])

      list.remove_dups_b!
      expect(list.size).to eq(1)
      expect(list.to_a).to eq([1])
    end
  end

  context 'when given a list with several 1s, 2s and 3s' do
    it 'returns only {1,2,3}' do
      list = ADT::List::SLList.new
      arr = []
      5.times {
        list.add(1)
        list.add(2)
        list.add(3)
        arr.append(1, 2, 3)
      }
      expect(list.size).to eq(15)
      expect(list.to_a).to eq(arr)

      list.remove_dups_b!
      expect(list.size).to eq(3)
      expect(list.to_a).to eq([1, 2, 3])
    end
  end

  context 'when given a list without repeated elements' do
    it 'returns the same list' do
      list = ADT::List::SLList.new
      arr = (1..20).to_a
      (1..20).each { |i|
        list.add(i)
      }
      expect(list.size).to eq(20)
      expect(list.to_a).to eq(arr)

      list.remove_dups_b!
      expect(list.size).to eq(20)
      expect(list.to_a).to eq(arr)
    end
  end
end