require 'rspec'
require 'chapter_2/linked_lists'

describe 'LinkedLists#palindrome?' do
  example "{1,2,1} should be a palindrome" do
    pending 'Not implemented yet'
    list = ADT::List::SLList.create_from_array([1, 2, 1])
    expect(list.palindrome?).to be_truthy
  end

  example "{red,green,blue,blue,green,red} should be a palindrome" do
    pending 'Not implemented yet'
    list = ADT::List::SLList.create_from_array(%w{red green blue blue green red})
    expect(list.palindrome?).to be_truthy
  end

  example "{red,green,blue,blue,green,red,red} should not be a palindrome" do
    pending 'Not implemented yet'
    list = ADT::List::SLList.create_from_array(%w{red green blue blue green red red})
    expect(list.palindrome?).to be_falsey
  end

  example "{1} should be a palindrome" do
    pending 'Not implemented yet'
    list = ADT::List::SLList.create_from_array([1])
    expect(list.palindrome?).to be_truthy
  end

  example "an empty list should be a palindrome" do
    pending 'Not implemented yet'
    list = ADT::List::SLList.new
    expect(list.palindrome?).to be_truthy
  end
end