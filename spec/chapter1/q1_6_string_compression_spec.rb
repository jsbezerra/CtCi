# frozen_string_literal: true

require "rspec"
require "chapter1/strings"

describe "Strings#string_compression" do
  example '"" should return ""' do
    expect(Chapter1::Strings.string_compression("")).to eq("")
  end

  example '"a" should return "a"' do
    expect(Chapter1::Strings.string_compression("a")).to eq("a")
  end

  example '"aabcccccaaa" should return "a2b1c5a3"' do
    expect(Chapter1::Strings.string_compression("aabcccccaaa")).to eq("a2b1c5a3")
  end

  example '"aabbccddeeffgghh" should return "aabbccddeeffgghh"' do
    expect(Chapter1::Strings.string_compression("aabbccddeeffgghh")).to eq("aabbccddeeffgghh")
  end

  example '"aabbccddeeeffgghh" should return "a2b2c2d2e3f2g2h2"' do
    expect(Chapter1::Strings.string_compression("aabbccddeeeffgghh")).to eq("a2b2c2d2e3f2g2h2")
  end

  example '"abcdefghijkl" should return "abcdefghijkl"' do
    expect(Chapter1::Strings.string_compression("abcdefghijkl")).to eq("abcdefghijkl")
  end

  example '"aaaaaaaaaa" should return "a10"' do
    expect(Chapter1::Strings.string_compression("aaaaaaaaaa")).to eq("a10")
  end

  example '"aaaaaaaaaabcb" should return "a10b1c1b1"' do
    expect(Chapter1::Strings.string_compression("aaaaaaaaaabcb")).to eq("a10b1c1b1")
  end

  example '"aaaaaaaaaabcb" should return "a10b1c1b1"' do
    expect(Chapter1::Strings.string_compression("aaaaaaaaaabcb")).to eq("a10b1c1b1")
  end

  example '"aaaaaaaaaabcbabc" should return "a10b1c1b1a1b1c1"' do
    expect(Chapter1::Strings.string_compression("aaaaaaaaaabcbabc")).to eq("a10b1c1b1a1b1c1")
  end

  example '"aaaaaaaaaabcbabca" should return "aaaaaaaaaabcbabca"' do
    expect(Chapter1::Strings.string_compression("aaaaaaaaaabcbabca")).to eq("aaaaaaaaaabcbabca")
  end

  example '"aaaaaaaaaabcbabcabc" should return "aaaaaaaaaabcbabcabc"' do
    expect(Chapter1::Strings.string_compression("aaaaaaaaaabcbabcabc")).to eq("aaaaaaaaaabcbabcabc")
  end

  example '"ffffuselmaoiioooekjejehhhhhaaaaaqwsfbbbbbbbbbbb" should return "f4uselmaoi2o3ekjejeh5a5qwsfb11"' do
    expect(Chapter1::Strings.string_compression("ffffuselmaoiioooekjejehhhhhaaaaaqwsfbbbbbbbbbbb"))
      .to eq("ffffuselmaoiioooekjejehhhhhaaaaaqwsfbbbbbbbbbbb")
  end

  example '"ffffuselmaoiioooekjejehhhhhaaaaaqwsfbbbbbbbbbbbbbbbb" should return "f4uselmaoi2o3ekjejeh5a5qwsfb11"' do
    expect(Chapter1::Strings.string_compression("ffffuselmaoiioooekjejehhhhhaaaaaqwsfbbbbbbbbbbbbbbbb"))
      .to eq("f4u1s1e1l1m1a1o1i2o3e1k1j1e1j1e1h5a5q1w1s1f1b16")
  end
end
