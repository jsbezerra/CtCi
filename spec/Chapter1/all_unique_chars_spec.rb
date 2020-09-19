require 'rspec'
require 'Chapter1/strings'

describe 'AllUniqueChars' do

  context 'when string is "abacaxi"' do
    str = "abacaxi"
    it 'is_unique_hash? returns false' do
      expect(Chapter1::Strings.is_unique_hash? str).to eq(false)
    end

    it 'is_unique_sort? returns false' do
      expect(Chapter1::Strings.is_unique_sort? str).to eq(false)
    end
  end

  context 'when string is "metal"' do
    str = "metal"
    it 'is_unique_hash? returns true' do
      expect(Chapter1::Strings.is_unique_hash? str).to eq(true)
    end

    it 'is_unique_sort? returns true' do
      expect(Chapter1::Strings.is_unique_sort? str).to eq(true)
    end
  end

  context 'when string is "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOaPQRSTUVWXYZ"' do
    str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOaPQRSTUVWXYZ"
    it 'is_unique_hash? returns false' do
      expect(Chapter1::Strings.is_unique_hash? str).to eq(false)
    end

    it 'is_unique_sort? returns false' do
      expect(Chapter1::Strings.is_unique_sort? str).to eq(false)
    end
  end

  context 'when string is "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"' do
    str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    it 'is_unique_hash? returns true' do
      expect(Chapter1::Strings.is_unique_hash? str).to eq(true)
    end

    it 'is_unique_sort? returns true' do
      expect(Chapter1::Strings.is_unique_sort? str).to eq(true)
    end
  end
end