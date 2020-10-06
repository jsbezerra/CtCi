require 'rspec'
require 'chapter2/linked_lists'

describe 'LinkedLists#palindrome?' do
  example "{1,2,1} should be a palindrome" do
    list = ADT::List::SLList.create_from_array([1, 2, 1])
    expect(list.palindrome?).to eq(true)
  end

  example "{red,green,blue,blue,green,red} should be a palindrome" do
    list = ADT::List::SLList.create_from_array(%w{red green blue blue green red})
    expect(list.palindrome?).to eq(true)
  end

  example "{red,green,blue,blue,green,red,red} should not be a palindrome" do
    list = ADT::List::SLList.create_from_array(%w{red green blue blue green red red})
    expect(list.palindrome?).to eq(false)
  end

  example "{red,green,red,green} should not be a palindrome" do
    list = ADT::List::SLList.create_from_array(%w{red green red green})
    expect(list.palindrome?).to eq(false)
  end

  example "{1} should be a palindrome" do
    list = ADT::List::SLList.create_from_array([1])
    expect(list.palindrome?).to eq(true)
  end

  example "an empty list should be a palindrome" do
    list = ADT::List::SLList.new
    expect(list.palindrome?).to eq(true)
  end
end