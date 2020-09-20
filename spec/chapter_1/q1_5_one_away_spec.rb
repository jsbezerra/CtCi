require 'rspec'
require 'chapter_1/strings'

describe 'OneAway' do

  context 'when given "pale" and "ple"' do
    it 'returns true' do
      expect(Chapter1::Strings.one_away?('pale', 'ple')).to eq(true)
    end
  end

  context 'when given "ple" and "pale"' do
    it 'returns true' do
      expect(Chapter1::Strings.one_away?('ple', 'pale')).to eq(true)
    end
  end

  context 'when given "pales" and "pale"' do
    it 'returns true' do
      expect(Chapter1::Strings.one_away?('pales', 'pale')).to eq(true)
    end
  end

  context 'when given "pale" and "pales"' do
    it 'returns true' do
      expect(Chapter1::Strings.one_away?('pale', 'pales')).to eq(true)
    end
  end

  context 'when given "pale" and "bale"' do
    it 'returns true' do
      expect(Chapter1::Strings.one_away?('pale', 'bale')).to eq(true)
    end
  end

  context 'when given "bale" and "pale"' do
    it 'returns true' do
      expect(Chapter1::Strings.one_away?('bale', 'pale')).to eq(true)
    end
  end

  context 'when given "pales" and "bale"' do
    it 'returns false' do
      expect(Chapter1::Strings.one_away?('pales', 'bale')).to eq(false)
    end
  end

  context 'when given "bale" and "pales"' do
    it 'returns false' do
      expect(Chapter1::Strings.one_away?('bale', 'pales')).to eq(false)
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

  context 'when given "bake" and "pale"' do
    it 'returns false' do
      expect(Chapter1::Strings.one_away?('bake', 'pale')).to eq(false)
    end
  end

  context 'when given "pale" and "bales"' do
    it 'returns false' do
      expect(Chapter1::Strings.one_away?('pale', 'bales')).to eq(false)
    end
  end

  context 'when given "bales" and "pale"' do
    it 'returns false' do
      expect(Chapter1::Strings.one_away?('bales', 'pale')).to eq(false)
    end
  end

  context 'when given "bale" and "bailes"' do
    it 'returns false' do
      expect(Chapter1::Strings.one_away?('pale', 'bailes')).to eq(false)
    end
  end

  context 'when given "bailes" and "bale"' do
    it 'returns false' do
      expect(Chapter1::Strings.one_away?('bailes', 'bale')).to eq(false)
    end
  end

  context 'when given "batata" and "batatata"' do
    it 'returns false' do
      expect(Chapter1::Strings.one_away?('batata', 'batatata')).to eq(false)
    end
  end

  context 'when given "batatata" and "batata"' do
    it 'returns false' do
      expect(Chapter1::Strings.one_away?('batatata', 'batata')).to eq(false)
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