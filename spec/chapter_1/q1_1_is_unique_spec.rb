require 'rspec'
require 'chapter_1/strings'

describe 'Strings#is_unique?' do

  context 'when string is "abacaxi"' do
    str = "abacaxi"
    it 'is_unique_hash? returns false' do
      expect(Chapter1::Strings.is_unique_hash? str).to be_falsey
    end

    it 'is_unique_sort? returns false' do
      expect(Chapter1::Strings.is_unique_sort? str).to be_falsey
    end
  end

  context 'when string is "metal"' do
    str = "metal"
    it 'is_unique_hash? returns true' do
      expect(Chapter1::Strings.is_unique_hash? str).to be_truthy
    end

    it 'is_unique_sort? returns true' do
      expect(Chapter1::Strings.is_unique_sort? str).to be_truthy
    end
  end

  context 'when string is "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOaPQRSTUVWXYZ"' do
    str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOaPQRSTUVWXYZ"
    it 'is_unique_hash? returns false' do
      expect(Chapter1::Strings.is_unique_hash? str).to be_falsey
    end

    it 'is_unique_sort? returns false' do
      expect(Chapter1::Strings.is_unique_sort? str).to be_falsey
    end
  end

  context 'when string is "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"' do
    str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    it 'is_unique_hash? returns true' do
      expect(Chapter1::Strings.is_unique_hash? str).to be_truthy
    end

    it 'is_unique_sort? returns true' do
      expect(Chapter1::Strings.is_unique_sort? str).to be_truthy
    end
  end
end