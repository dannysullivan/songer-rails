require 'spec_helper'
require 'rails_helper'

describe Lyricist do
  describe '#pick_rhyming_lines' do
    it 'returns two lines with the given number of syllables that rhyme' do
      markov_chain = MarkovChain.new("a test to rest something test test test test")
      lyricist = Lyricist.new(markov_chain)
      lines = lyricist.pick_rhyming_lines(1)
      expect(['test', 'rest']).to include lines.first.first.value
      expect(['test', 'rest']).to include lines.second.first.value
      expect(lines.first.map(&:value)).not_to eq lines.second.map(&:value)
      expect(lines.first.first.value).not_to eq lines.second.first.value
    end
  end

  describe '#rhyming_line_string' do
    it 'returns a string representation of the constructed lyrics' do
      markov_chain = MarkovChain.new("a test to rest now")
      lyricist = Lyricist.new(markov_chain)
      lyrics = lyricist.rhyming_lines_string(1)
      possible_outcomes = ["test\nrest", "rest\ntest"]
      expect(possible_outcomes).to include lyrics
    end
  end
end
