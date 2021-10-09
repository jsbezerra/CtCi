# frozen_string_literal: true

require "rspec"
require "chapter1/strings"

describe "Strings#one_away?" do
  example '"pale" and "pale" should return true' do
    expect(Chapter1::Strings.one_away?("pale", "pale")).to eq(true)
  end

  example '"pale" and "ple" should return true' do
    expect(Chapter1::Strings.one_away?("pale", "ple")).to eq(true)
  end

  example '"ple" and "pale" should return true' do
    expect(Chapter1::Strings.one_away?("ple", "pale")).to eq(true)
  end

  example '"pales" and "pale" should return true' do
    expect(Chapter1::Strings.one_away?("pales", "pale")).to eq(true)
  end

  example '"pale" and "pales" should return true' do
    expect(Chapter1::Strings.one_away?("pale", "pales")).to eq(true)
  end

  example '"pale" and "bale" should return true' do
    expect(Chapter1::Strings.one_away?("pale", "bale")).to eq(true)
  end

  example '"bale" and "pale" should return true' do
    expect(Chapter1::Strings.one_away?("bale", "pale")).to eq(true)
  end

  example '"pales" and "bale" should return false' do
    expect(Chapter1::Strings.one_away?("pales", "bale")).to eq(false)
  end

  example '"bale" and "pales" should return false' do
    expect(Chapter1::Strings.one_away?("bale", "pales")).to eq(false)
  end

  example '"bale" and "baele" should return true' do
    expect(Chapter1::Strings.one_away?("bale", "baele")).to eq(true)
  end

  example '"baele" and "bale" should return true' do
    expect(Chapter1::Strings.one_away?("baele", "bale")).to eq(true)
  end

  example '"pale" and "bake" should return false' do
    expect(Chapter1::Strings.one_away?("pale", "bake")).to eq(false)
  end

  example '"bake" and "pale" should return false' do
    expect(Chapter1::Strings.one_away?("bake", "pale")).to eq(false)
  end

  example '"pale" and "bales" should return false' do
    expect(Chapter1::Strings.one_away?("pale", "bales")).to eq(false)
  end

  example '"bales" and "pale" should return false' do
    expect(Chapter1::Strings.one_away?("bales", "pale")).to eq(false)
  end

  example '"bale" and "bailes" should return false' do
    expect(Chapter1::Strings.one_away?("pale", "bailes")).to eq(false)
  end

  example '"bailes" and "bale" should return false' do
    expect(Chapter1::Strings.one_away?("bailes", "bale")).to eq(false)
  end

  example '"batata" and "batatata" should return false' do
    expect(Chapter1::Strings.one_away?("batata", "batatata")).to eq(false)
  end

  example '"batatata" and "batata" should return false' do
    expect(Chapter1::Strings.one_away?("batatata", "batata")).to eq(false)
  end

  example '"remela" and "camela" should return false' do
    expect(Chapter1::Strings.one_away?("remela", "camela")).to eq(false)
  end

  example '"arvoredo" and "orvoreda" should return false' do
    expect(Chapter1::Strings.one_away?("arvoredo", "orvoreda")).to eq(false)
  end

  example '"arvoredo" and "orvored" should return false' do
    expect(Chapter1::Strings.one_away?("arvoredo", "orvored")).to eq(false)
  end

  example '"arvoredo" and "arvored" should return true' do
    expect(Chapter1::Strings.one_away?("arvoredo", "arvored")).to eq(true)
  end
end
