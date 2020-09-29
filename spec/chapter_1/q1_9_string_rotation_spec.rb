require 'rspec'
require 'chapter_1/strings'

describe 'Strings#string_rotation?' do

  example '"abacaxi" and "abacaxi" should return true' do
    pending 'Not implemented yet'
    expect(Chapter1::Strings.string_rotation?('abacaxi', 'abacaxi')).to be_truthy
  end

  example '"abacaxi" and "abaxica" should return false' do
    pending 'Not implemented yet'
    expect(Chapter1::Strings.string_rotation?('abacaxi', 'abaxica')).to be_falsey
  end

  example '"waterbottle" and "erbottlewat" should return true' do
    pending 'Not implemented yet'
    expect(Chapter1::Strings.string_rotation?('waterbottle', 'erbottlewat')).to be_truthy
  end

  example '"waterbottle" and "waterbottles" should return false' do
    pending 'Not implemented yet'
    expect(Chapter1::Strings.string_rotation?('waterbottle', 'waterbottles')).to be_falsey
  end

  example '"waterbottles" and "waterbottle" should return false' do
    pending 'Not implemented yet'
    expect(Chapter1::Strings.string_rotation?('waterbottles', 'waterbottle')).to be_falsey
  end
end