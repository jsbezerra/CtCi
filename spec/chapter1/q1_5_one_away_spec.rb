require 'rspec'
require 'chapter1/strings'

describe 'Strings#one_away?' do

  example '"pale" and "ple" should return true' do
    expect(Chapter1::Strings.one_away?('pale', 'ple')).to be_truthy
  end

  example '"ple" and "pale" should return true' do
    expect(Chapter1::Strings.one_away?('ple', 'pale')).to be_truthy
  end

  example '"pales" and "pale" should return true' do
    expect(Chapter1::Strings.one_away?('pales', 'pale')).to be_truthy
  end

  example '"pale" and "pales" should return true' do
    expect(Chapter1::Strings.one_away?('pale', 'pales')).to be_truthy
  end

  example '"pale" and "bale" should return true' do
    expect(Chapter1::Strings.one_away?('pale', 'bale')).to be_truthy
  end

  example '"bale" and "pale" should return true' do
    expect(Chapter1::Strings.one_away?('bale', 'pale')).to be_truthy
  end

  example '"pales" and "bale" should return false' do
    expect(Chapter1::Strings.one_away?('pales', 'bale')).to be_falsey
  end

  example '"bale" and "pales" should return false' do
    expect(Chapter1::Strings.one_away?('bale', 'pales')).to be_falsey
  end

  example '"bale" and "baele" should return true' do
    expect(Chapter1::Strings.one_away?('bale', 'baele')).to be_truthy
  end

  example '"baele" and "bale" should return true' do
    expect(Chapter1::Strings.one_away?('baele', 'bale')).to be_truthy
  end

  example '"pale" and "bake" should return false' do
    expect(Chapter1::Strings.one_away?('pale', 'bake')).to be_falsey
  end

  example '"bake" and "pale" should return false' do
    expect(Chapter1::Strings.one_away?('bake', 'pale')).to be_falsey
  end

  example '"pale" and "bales" should return false' do
    expect(Chapter1::Strings.one_away?('pale', 'bales')).to be_falsey
  end

  example '"bales" and "pale" should return false' do
    expect(Chapter1::Strings.one_away?('bales', 'pale')).to be_falsey
  end

  example '"bale" and "bailes" should return false' do
    expect(Chapter1::Strings.one_away?('pale', 'bailes')).to be_falsey
  end

  example '"bailes" and "bale" should return false' do
    expect(Chapter1::Strings.one_away?('bailes', 'bale')).to be_falsey
  end

  example '"batata" and "batatata" should return false' do
    expect(Chapter1::Strings.one_away?('batata', 'batatata')).to be_falsey
  end

  example '"batatata" and "batata" should return false' do
    expect(Chapter1::Strings.one_away?('batatata', 'batata')).to be_falsey
  end

  example '"remela" and "camela" should return false' do
    expect(Chapter1::Strings.one_away?('remela', 'camela')).to be_falsey
  end

  example '"arvoredo" and "orvoreda" should return false' do
    expect(Chapter1::Strings.one_away?('arvoredo', 'orvoreda')).to be_falsey
  end

  example '"arvoredo" and "orvored" should return false' do
    expect(Chapter1::Strings.one_away?('arvoredo', 'orvored')).to be_falsey
  end

  example '"arvoredo" and "arvored" should return true' do
    expect(Chapter1::Strings.one_away?('arvoredo', 'arvored')).to be_truthy
  end
end