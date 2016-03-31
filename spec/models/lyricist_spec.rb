require 'spec_helper'
require 'rails_helper'

describe Lyricist do
  describe '#pick_lyrics' do
    it 'picks lyrics based on the training text' do
      lyricist = Lyricist.new(MarkovChain.new('it is'))
      3.times do
        lyrics = lyricist.pick_lyrics(2)
        expect(lyrics.map(&:value)).to eq ['it', 'is']
      end
    end
  end

  describe '#get_first_word' do
    it 'does not return any prepositions' do
      lyricist = Lyricist.new(MarkovChain.new("it is about"))
      expect(lyricist.pick_lyrics(2).map(&:value)).to eq ['it', 'is']
    end
  end

  describe '#pick_rhyming_lines' do
    it 'returns two lines with the given number of syllables that rhyme' do
      lyricist = Lyricist.new(MarkovChain.new("a test a rest"))
      lines = lyricist.pick_rhyming_lines(2)
      expect([['a', 'test'], ['a', 'rest']]).to include lines.first.map(&:value)
      expect([['a', 'test'], ['a', 'rest']]).to include lines.second.map(&:value)
      expect(lines.first.map(&:value)).not_to eq lines.second.map(&:value)
    end
  end
end
