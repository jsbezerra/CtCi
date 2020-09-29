require 'rspec'
require 'adt/list'

describe 'SLList' do

  def create_and_add_values(values = [])
    @list = ADT::List::SLList.new
    values.each do |v|
      @list.add(v)
    end
  end

  context 'when creating' do
    it 'creates an empty list' do
      @list = ADT::List::SLList.new
      expect(@list.size).to eq(0)
    end
  end

  context 'when adding an element' do
    it 'increases the list size' do
      create_and_add_values
      expect(@list.size).to eq(0)
      @list.add(1)
      expect(@list.size).to eq(1)
      @list.add(3)
      expect(@list.size).to eq(2)
    end

    it 'appends each element to the end of the list in the order they are given' do
      create_and_add_values [5, 4, 3, 2, 3]
      arr = @list.to_a
      expect(arr).to eq([5, 4, 3, 2, 3])
    end
  end

  context 'when deleting an element' do

    it 'removes only the first occurrence of that element' do
      create_and_add_values [5, 4, 3, 2, 3]

      @list.delete(3)

      arr = @list.to_a
      expect(arr).to eq([5, 4, 2, 3])
    end

    it 'decreases the list size' do
      create_and_add_values [5, 4, 3, 2, 3]
      expect(@list.size).to eq(5)

      @list.delete(3)
      expect(@list.size).to eq(4)
    end
  end

  example "the sum of a list {5,4} should be 9" do
    create_and_add_values [5, 4]
    a = 0
    @list.each do |v|
      a += v
    end
    expect(a).to eq(9)
  end
end