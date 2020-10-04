require 'rspec'
require 'chapter_1/strings'

describe 'Strings#palindrome_permutation?' do

  context 'when string is "Tact Coa"' do
    str = 'Tact Coa'
    it 'returns true' do
      expect(Chapter1::Strings.palindrome_permutation? str).to be_truthy
    end
  end

  context 'when string is "Coca Cola"' do
    str = 'Coca Cola'
    it 'returns false' do
      expect(Chapter1::Strings.palindrome_permutation? str).to be_falsey
    end
  end
end