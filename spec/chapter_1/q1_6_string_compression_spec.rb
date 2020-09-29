require 'rspec'
require 'chapter_1/strings'

describe 'Strings#string_compression' do

  context 'when given "aabcccccaaa"' do
    it 'returns "a2b1c5a3"' do
      expect(Chapter1::Strings.string_compression('aabcccccaaa')).to eq('a2b1c5a3')
    end
  end

  context 'when given "aabbccddeeffgghh"' do
    it 'returns "aabbccddeeffgghh"' do
      expect(Chapter1::Strings.string_compression('aabbccddeeffgghh')).to eq('aabbccddeeffgghh')
    end
  end

  context 'when given "aabbccddeeeffgghh"' do
    it 'returns "a2b2c2d2e3f2g2h2"' do
      expect(Chapter1::Strings.string_compression('aabbccddeeeffgghh')).to eq('a2b2c2d2e3f2g2h2')
    end
  end

  context 'when given "abcdefghijkl"' do
    it 'returns "abcdefghijkl"' do
      expect(Chapter1::Strings.string_compression('abcdefghijkl')).to eq('abcdefghijkl')
    end
  end

  context 'when given "aaaaaaaaaa"' do
    it 'returns "a10"' do
      expect(Chapter1::Strings.string_compression('aaaaaaaaaa')).to eq('a10')
    end
  end

  context 'when given "aaaaaaaaaabcb"' do
    it 'returns "a10b1c1b1"' do
      expect(Chapter1::Strings.string_compression('aaaaaaaaaabcb')).to eq('a10b1c1b1')
    end
  end

  context 'when given "aaaaaaaaaabcb"' do
    it 'returns "a10b1c1b1"' do
      expect(Chapter1::Strings.string_compression('aaaaaaaaaabcb')).to eq('a10b1c1b1')
    end
  end

  context 'when given "aaaaaaaaaabcbabc"' do
    it 'returns "a10b1c1b1a1b1c1"' do
      expect(Chapter1::Strings.string_compression('aaaaaaaaaabcbabc')).to eq('a10b1c1b1a1b1c1')
    end
  end

  context 'when given "aaaaaaaaaabcbabca"' do
    it 'returns "aaaaaaaaaabcbabca"' do
      expect(Chapter1::Strings.string_compression('aaaaaaaaaabcbabca')).to eq('aaaaaaaaaabcbabca')
    end
  end

  context 'when given "aaaaaaaaaabcbabcabc"' do
    it 'returns "aaaaaaaaaabcbabcabc"' do
      expect(Chapter1::Strings.string_compression('aaaaaaaaaabcbabcabc')).to eq('aaaaaaaaaabcbabcabc')
    end
  end
end