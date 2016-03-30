require 'spec_helper'
require 'rails_helper'

describe '#pick_lyrics' do
  context 'with one syllable words' do
    it 'picks random lyrics to fit the given number of syllables' do
      stub_const('SYLLABLES', {test: 1})
      lyrics = LyricsFetcher.pick_lyrics(2)
      expect(lyrics.map(&:value)).to eq ['test', 'test']
      expect(lyrics.map(&:syllables)).to eq [1, 1]
    end
  end

  context 'with multi-syllable words' do
    it 'only picks words that fit the given number of syllables' do
      stub_const('SYLLABLES', {testing: 2, otherwise: 3})
      fetcher = LyricsFetcher
      lyrics = fetcher.pick_lyrics(2)
      expect(lyrics.map(&:value)).to eq ['testing']

      lyrics = fetcher.pick_lyrics(5)
      expect(lyrics.map(&:value)).to include 'testing'
    end
  end
end
