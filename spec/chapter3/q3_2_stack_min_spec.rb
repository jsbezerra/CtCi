require 'rspec'
require 'chapter3/stacks'

describe 'StackMin' do
  describe '#new' do
    it 'creates an empty stack' do
      stack = ADT::StackMin.new
      expect(stack.empty?).to be_truthy
    end

    it 'has nil as min element' do
      stack = ADT::StackMin.new
      expect(stack.min).to be_nil
    end
  end

  describe '#push' do
    it 'adds an element to the stack' do
      stack = ADT::StackMin.new
      stack.push(10)
      expect(stack.empty?).to be_falsey
    end

    it 'adds an element at the top of the stack' do
      stack = ADT::StackMin.new
      stack.push(10)
      stack.push(20)
      stack.push(30)
      expect(stack.peek).to be(30)
    end

    it 'keeps the min element' do
      stack = ADT::StackMin.new
      stack.push(10)
      stack.push(20)
      stack.push(30)
      expect(stack.min).to be(10)
    end
  end

  describe '#peek' do
    it 'returns the value of the element at the top' do
      stack = ADT::StackMin.new
      stack.push(10)
      stack.push(20)
      stack.push(30)
      expect(stack.peek).to be(30)
    end

    it 'does not remove the element from the stack' do
      stack = ADT::StackMin.new
      expect(stack.empty?).to be_truthy
      stack.push(10)
      expect(stack.empty?).to be_falsey
      expect(stack.peek).to be(10)
      expect(stack.empty?).to be_falsey
    end

    it 'returns nil if stack is empty' do
      stack = ADT::StackMin.new
      expect(stack.peek).to be_nil
    end
  end

  describe '#pop' do
    it 'returns the value of the element at the top' do
      stack = ADT::StackMin.new
      stack.push(10)
      stack.push(20)
      stack.push(30)
      expect(stack.pop).to be(30)
    end

    it 'removes the element from the top of the stack' do
      stack = ADT::StackMin.new
      expect(stack.empty?).to be_truthy
      stack.push(10)
      expect(stack.empty?).to be_falsey
      expect(stack.pop).to be(10)
      expect(stack.empty?).to be_truthy
    end

    it 'updates the min element if it is removed' do
      stack = ADT::StackMin.new
      stack.push(30)
      stack.push(11)
      stack.push(20)
      stack.push(10)
      expect(stack.min).to be(10)
      expect(stack.pop).to be(10)
      expect(stack.min).to be(11)
    end

    it 'updates the min element to nil if list is empty' do
      stack = ADT::StackMin.new
      stack.push(10)
      expect(stack.min).to be(10)
      expect(stack.pop).to be(10)
      expect(stack.min).to be_nil
    end

    it 'returns nil if stack is empty' do
      stack = ADT::StackMin.new
      expect(stack.pop).to be_nil
    end
  end

  describe '#empty?' do
    it 'returns true if the stack is empty' do
      stack = ADT::StackMin.new
      expect(stack.empty?).to be_truthy
    end

    it 'returns false if the stack is not empty' do
      stack = ADT::StackMin.new
      stack.push(10)
      expect(stack.empty?).to be_falsey
    end
  end
end
