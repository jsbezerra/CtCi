# frozen_string_literal: true

require "rspec"
require "chapter1/strings"

describe "Strings#urlify" do
  context 'when string is "Mr John Smith"' do
    str = "Mr John Smith"
    it 'returns "Mr%20John%20Smith"' do
      expect(Chapter1::Strings.urlify(str)).to eq("Mr%20John%20Smith")
    end
  end

  context 'when string is "     "' do
    str = "     "
    it 'returns "%20%20%20%20%20"' do
      expect(Chapter1::Strings.urlify(str)).to eq("%20%20%20%20%20")
    end
  end

  context 'when string is "CrackingTheCodingInterview"' do
    str = "CrackingTheCodingInterview"
    it 'returns "CrackingTheCodingInterview"' do
      expect(Chapter1::Strings.urlify(str)).to eq("CrackingTheCodingInterview")
    end
  end
end
