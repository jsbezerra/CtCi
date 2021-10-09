# frozen_string_literal: true

require "rspec"
require "chapter1/strings"

describe "Strings#string_rotation?" do
  example '"abacaxi" and "abacaxi" should return true' do
    expect(Chapter1::Strings.string_rotation?("abacaxi", "abacaxi")).to eq(true)
  end

  example '"abacaxi" and "abaxica" should return false' do
    expect(Chapter1::Strings.string_rotation?("abacaxi", "abaxica")).to eq(false)
  end

  example '"waterbottle" and "erbottlewat" should return true' do
    expect(Chapter1::Strings.string_rotation?("waterbottle", "erbottlewat")).to eq(true)
  end

  example '"waterbottle" and "waterbottles" should return false' do
    expect(Chapter1::Strings.string_rotation?("waterbottle", "waterbottles")).to eq(false)
  end

  example '"waterbottles" and "waterbottle" should return false' do
    expect(Chapter1::Strings.string_rotation?("waterbottles", "waterbottle")).to eq(false)
  end
end
