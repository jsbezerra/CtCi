require 'rspec'
require 'chapter_1/strings'

describe 'Strings#one_away?' do

  context 'when given "pale" and "ple"' do
    it 'returns true' do
      expect(Chapter1::Strings.one_away?('pale', 'ple')).to be_truthy
    end
  end

  context 'when given "ple" and "pale"' do
    it 'returns true' do
      expect(Chapter1::Strings.one_away?('ple', 'pale')).to be_truthy
    end
  end

  context 'when given "pales" and "pale"' do
    it 'returns true' do
      expect(Chapter1::Strings.one_away?('pales', 'pale')).to be_truthy
    end
  end

  context 'when given "pale" and "pales"' do
    it 'returns true' do
      expect(Chapter1::Strings.one_away?('pale', 'pales')).to be_truthy
    end
  end

  context 'when given "pale" and "bale"' do
    it 'returns true' do
      expect(Chapter1::Strings.one_away?('pale', 'bale')).to be_truthy
    end
  end

  context 'when given "bale" and "pale"' do
    it 'returns true' do
      expect(Chapter1::Strings.one_away?('bale', 'pale')).to be_truthy
    end
  end

  context 'when given "pales" and "bale"' do
    it 'returns false' do
      expect(Chapter1::Strings.one_away?('pales', 'bale')).to be_falsey
    end
  end

  context 'when given "bale" and "pales"' do
    it 'returns false' do
      expect(Chapter1::Strings.one_away?('bale', 'pales')).to be_falsey
    end
  end

  context 'when given "bale" and "baele"' do
    it 'returns true' do
      expect(Chapter1::Strings.one_away?('bale', 'baele')).to be_truthy
    end
  end

  context 'when given "baele" and "bale"' do
    it 'returns true' do
      expect(Chapter1::Strings.one_away?('baele', 'bale')).to be_truthy
    end
  end

  context 'when given "pale" and "bake"' do
    it 'returns false' do
      expect(Chapter1::Strings.one_away?('pale', 'bake')).to be_falsey
    end
  end

  context 'when given "bake" and "pale"' do
    it 'returns false' do
      expect(Chapter1::Strings.one_away?('bake', 'pale')).to be_falsey
    end
  end

  context 'when given "pale" and "bales"' do
    it 'returns false' do
      expect(Chapter1::Strings.one_away?('pale', 'bales')).to be_falsey
    end
  end

  context 'when given "bales" and "pale"' do
    it 'returns false' do
      expect(Chapter1::Strings.one_away?('bales', 'pale')).to be_falsey
    end
  end

  context 'when given "bale" and "bailes"' do
    it 'returns false' do
      expect(Chapter1::Strings.one_away?('pale', 'bailes')).to be_falsey
    end
  end

  context 'when given "bailes" and "bale"' do
    it 'returns false' do
      expect(Chapter1::Strings.one_away?('bailes', 'bale')).to be_falsey
    end
  end

  context 'when given "batata" and "batatata"' do
    it 'returns false' do
      expect(Chapter1::Strings.one_away?('batata', 'batatata')).to be_falsey
    end
  end

  context 'when given "batatata" and "batata"' do
    it 'returns false' do
      expect(Chapter1::Strings.one_away?('batatata', 'batata')).to be_falsey
    end
  end

  context 'when given "remela" and "camela"' do
    it 'returns false' do
      expect(Chapter1::Strings.one_away?('remela', 'camela')).to be_falsey
    end
  end

  context 'when given "arvoredo" and "orvoreda"' do
    it 'returns false' do
      expect(Chapter1::Strings.one_away?('arvoredo', 'orvoreda')).to be_falsey
    end
  end

  context 'when given "arvoredo" and "orvored"' do
    it 'returns false' do
      expect(Chapter1::Strings.one_away?('arvoredo', 'orvored')).to be_falsey
    end
  end

  context 'when given "arvoredo" and "arvored"' do
    it 'returns true' do
      expect(Chapter1::Strings.one_away?('arvoredo', 'arvored')).to be_truthy
    end
  end
end