require 'rspec'
require 'chapter4/trees'

describe 'TreeNode#create_minimal_bts' do

  example '[1,2,3,4,5,6,7,8,9,10]' do
    root = ADT::Tree::TreeNode.create_minimal_bts([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
    expect(root.to_in_order_a).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
    expect(root.data).to eq(5)
    expect(root.left.data).to eq(2)
    expect(root.right.data).to eq(8)
    expect(root.left.left.data).to eq(1)
    expect(root.left.right.data).to eq(3)
    expect(root.left.right.right.data).to eq(4)
    expect(root.right.left.data).to eq(6)
    expect(root.right.left.right.data).to eq(7)
    expect(root.right.right.data).to eq(9)
    expect(root.right.right.right.data).to eq(10)
  end
end