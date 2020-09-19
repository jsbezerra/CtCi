require 'rspec'
require 'chapter_1/strings'

describe 'CheckPermutation' do

  context 'given "iracema" and "america"' do
    str1 = "iracema"
    str2 = "america"
    it 'check_permutation_hash? returns true' do
      expect(Chapter1::Strings.check_permutation_hash? str1, str2).to eq(true)
    end

    it 'check_permutation_sort? returns true' do
      expect(Chapter1::Strings.check_permutation_sort? str1, str2).to eq(true)
    end
  end

  context 'given "quid est veritas " and "est vir qui adest"' do
    str1 = "quid est veritas "
    str2 = "est vir qui adest"
    it 'check_permutation_hash? returns true' do
      expect(Chapter1::Strings.check_permutation_hash? str1, str2).to eq(true)
    end

    it 'check_permutation_sort? returns true' do
      expect(Chapter1::Strings.check_permutation_sort? str1, str2).to eq(true)
    end
  end

  context 'given "batata" and "batatao"' do
    str1 = "batata"
    str2 = "batatao"
    it 'check_permutation_hash? returns false' do
      expect(Chapter1::Strings.check_permutation_hash? str1, str2).to eq(false)
    end

    it 'check_permutation_sort? returns false' do
      expect(Chapter1::Strings.check_permutation_sort? str1, str2).to eq(false)
    end
  end

  context 'given "batata" and "batato"' do
    str1 = "batata"
    str2 = "batato"
    it 'check_permutation_hash? returns false' do
      expect(Chapter1::Strings.check_permutation_hash? str1, str2).to eq(false)
    end

    it 'check_permutation_sort? returns false' do
      expect(Chapter1::Strings.check_permutation_sort? str1, str2).to eq(false)
    end
  end
end