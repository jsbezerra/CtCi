require 'rspec'
require "Chapter4/MinimalTree"

describe 'MinimalTree' do
  before do
    # Do nothing
  end

  after do
    # Do nothing
  end

  describe "crete_minimal_bts" do
    context 'when the values are [1,2,3,4,5,6,7,8,9,10]' do
      root = Chapter4::MinimalTree.create_minimal_bts([1,2,3,4,5,6,7,8,9,10])
      it 'has 6 as root' do
        expect(root.data).to eq(5)
      end
    end
  end

end