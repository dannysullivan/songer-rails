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
end
