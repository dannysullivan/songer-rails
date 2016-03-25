require 'spec_helper'
require 'rails_helper'

describe '#pick_lyrics' do
  context 'with one syllable words' do
    it 'picks random lyrics to fit the given number of syllables' do
      word = create(:word, value: 'test', syllables: 1)
      lyrics = LyricsFetcher.pick_lyrics(2)
      expect(lyrics).to eq [word, word]
    end
  end

  context 'with multi-syllable words' do
    it 'only picks words that fit the given number of syllables' do
      create(:word, value: 'syllable', syllables: 3)
      testing = create(:word, value: 'testing', syllables: 2)
      lyrics = LyricsFetcher.pick_lyrics(2)
      expect(lyrics).to eq [testing]

      lyrics = LyricsFetcher.pick_lyrics(5)
      expect(lyrics).to include testing
    end
  end
end
