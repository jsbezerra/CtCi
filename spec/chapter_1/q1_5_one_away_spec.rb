require 'rspec'
require 'chapter_1/strings'

describe 'OneAway' do

  context 'when given "pale" and "ple"' do
    it 'returns true' do
      expect(Chapter1::Strings.one_away?('pale', 'ple')).to eq(true)
    end
  end

  context 'when given "pales" and "pale"' do
    it 'returns true' do
      expect(Chapter1::Strings.one_away?('pales', 'pale')).to eq(true)
    end
  end

  context 'when given "pale" and "bale"' do
    it 'returns true' do
      expect(Chapter1::Strings.one_away?('pale', 'bale')).to eq(true)
    end
  end

  context 'when given "bale" and "baele"' do
    it 'returns true' do
      expect(Chapter1::Strings.one_away?('bale', 'baele')).to eq(true)
    end
  end

  context 'when given "baele" and "bale"' do
    it 'returns true' do
      expect(Chapter1::Strings.one_away?('baele', 'bale')).to eq(true)
    end
  end

  context 'when given "pale" and "bake"' do
    it 'returns false' do
      expect(Chapter1::Strings.one_away?('pale', 'bake')).to eq(false)
    end
  end

  context 'when given "pale" and "bales"' do
    it 'returns false' do
      expect(Chapter1::Strings.one_away?('pale', 'bales')).to eq(false)
    end
  end

  context 'when given "bale" and "bailes"' do
    it 'returns false' do
      expect(Chapter1::Strings.one_away?('pale', 'bailes')).to eq(false)
    end
  end

  context 'when given "batata" and "batatata"' do
    it 'returns false' do
      expect(Chapter1::Strings.one_away?('batata', 'batatata')).to eq(false)
    end
  end

  context 'when given "remela" and "camela"' do
    it 'returns false' do
      expect(Chapter1::Strings.one_away?('remela', 'camela')).to eq(false)
    end
  end

  context 'when given "arvoredo" and "orvoreda"' do
    it 'returns false' do
      expect(Chapter1::Strings.one_away?('arvoredo', 'orvoreda')).to eq(false)
    end
  end

  context 'when given "arvoredo" and "orvored"' do
    it 'returns false' do
      expect(Chapter1::Strings.one_away?('arvoredo', 'orvored')).to eq(false)
    end
  end

  context 'when given "arvoredo" and "arvored"' do
    it 'returns true' do
      expect(Chapter1::Strings.one_away?('arvoredo', 'arvored')).to eq(true)
    end
  end
end