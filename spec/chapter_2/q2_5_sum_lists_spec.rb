require 'rspec'
require 'chapter_2/linked_lists'

describe 'LinkedLists#sum_lists_r' do

  example 'empty lists should return empty list' do
    list1 = ADT::List::SLList.new
    list2 = ADT::List::SLList.new
    expect(Chapter2::LinkedLists.sum_lists_r(list1, list2).empty?).to be_truthy
  end

  example 'lists {7,1,6} and empty should return {7,1,6}' do
    list1 = ADT::List::SLList.create_from_array [7, 1, 6]
    list2 = ADT::List::SLList.new
    expect(Chapter2::LinkedLists.sum_lists_r(list1, list2).to_a).to eq([7, 1, 6])
  end

  example 'lists empty and {5,9,2} should return {5,9,2}' do
    list1 = ADT::List::SLList.new
    list2 = ADT::List::SLList.create_from_array [5, 9, 2]
    expect(Chapter2::LinkedLists.sum_lists_r(list1, list2).to_a).to eq([5, 9, 2])
  end

  example 'lists {7,1,6} and {5,9,2} should return {2,1,9}' do
    list1 = ADT::List::SLList.create_from_array [7, 1, 6]
    list2 = ADT::List::SLList.create_from_array [5, 9, 2]
    expect(Chapter2::LinkedLists.sum_lists_r(list1, list2).to_a).to eq([2, 1, 9])
  end

  example 'lists {7,5,1} and {6,4,9,7} should return {3,0,1,8}' do
    list1 = ADT::List::SLList.create_from_array [7, 5, 1]
    list2 = ADT::List::SLList.create_from_array [6, 4, 9, 7]
    expect(Chapter2::LinkedLists.sum_lists_r(list1, list2).to_a).to eq([3, 0, 1, 8])
  end

  example 'lists {6,4,9,7} and {7,5,1} should return {3,0,1,8}' do
    list1 = ADT::List::SLList.create_from_array [6, 4, 9, 7]
    list2 = ADT::List::SLList.create_from_array [7, 5, 1]
    expect(Chapter2::LinkedLists.sum_lists_r(list1, list2).to_a).to eq([3, 0, 1, 8])
  end

  example "lists {9,9,9} and {5,1} should return {4,1,0,1}" do
    list1 = ADT::List::SLList.create_from_array [9, 9, 9]
    list2 = ADT::List::SLList.create_from_array [5, 1]
    expect(Chapter2::LinkedLists.sum_lists_r(list1, list2).to_a).to eq([4, 1, 0, 1])
  end
end

describe 'LinkedLists#sum_lists_f' do

  example 'empty lists should return empty list' do
    pending 'Not implemented yet'
    list1 = ADT::List::SLList.new
    list2 = ADT::List::SLList.new
    expect(Chapter2::LinkedLists.sum_lists_f(list1, list2).empty?).to be_truthy
  end

  example 'lists {6,1,7} and empty should return {6,1,7}' do
    pending 'Not implemented yet'
    list1 = ADT::List::SLList.create_from_array [6, 1, 7]
    list2 = ADT::List::SLList.new
    expect(Chapter2::LinkedLists.sum_lists_f(list1, list2).to_a).to eq([6, 1, 7])
  end

  example 'lists empty and {2,9,5} should return {2,9,5}' do
    pending 'Not implemented yet'
    list1 = ADT::List::SLList.new
    list2 = ADT::List::SLList.create_from_array [2, 9, 5]
    expect(Chapter2::LinkedLists.sum_lists_f(list1, list2).to_a).to eq([2, 9, 5])
  end

  example 'lists {6,1,7} and {2,9,5} should return {9,1,2}' do
    pending 'Not implemented yet'
    list1 = ADT::List::SLList.create_from_array [6, 1, 7]
    list2 = ADT::List::SLList.create_from_array [2, 9, 5]
    expect(Chapter2::LinkedLists.sum_lists_f(list1, list2).to_a).to eq([9, 1, 2])
  end

  example 'lists {1,5,7} and {7,9,4,6} should return {8,1,0,3}' do
    pending 'Not implemented yet'
    list1 = ADT::List::SLList.create_from_array [1, 5, 7]
    list2 = ADT::List::SLList.create_from_array [7, 9, 4, 6]
    expect(Chapter2::LinkedLists.sum_lists_f(list1, list2).to_a).to eq([8, 1, 0, 3])
  end

  example 'lists {7,9,4,6} and {1,5,7} should return {8,1,0,3}' do
    pending 'Not implemented yet'
    list1 = ADT::List::SLList.create_from_array [7, 4, 9, 6]
    list2 = ADT::List::SLList.create_from_array [1, 5, 7]
    expect(Chapter2::LinkedLists.sum_lists_f(list1, list2).to_a).to eq([8, 1, 0, 3])
  end

  example "lists {9,9,9} and {1,5} should return {1,0,1,4}" do
    pending 'Not implemented yet'
    list1 = ADT::List::SLList.create_from_array [9, 9, 9]
    list2 = ADT::List::SLList.create_from_array [1, 5]
    expect(Chapter2::LinkedLists.sum_lists_f(list1, list2).to_a).to eq([1, 0, 1, 4])
  end
end