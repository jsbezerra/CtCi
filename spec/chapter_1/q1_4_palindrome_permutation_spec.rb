require 'rspec'
require 'chapter_1/strings'

describe 'PalindromePermutation' do

  context 'when string is "Tact Coa"' do
    str = 'Tact Coa'
    it 'returns true' do
      expect(Chapter1::Strings.palindrome_permutation? str).to eq(true)
    end
  end

  context 'when string is "Coca Cola"' do
    str = 'Coca Cola'
    it 'returns false' do
      expect(Chapter1::Strings.palindrome_permutation? str).to eq(false )
    end
  end
end