require 'spec_helper'
require 'rails_helper'

describe Lyricist do
  describe '#pick_lyrics' do
    it 'picks lyrics based on the training text' do
      create(:word, value: 'it', syllables: 1)
      create(:word, value: 'is', syllables: 1)

      fetcher = Lyricist.new('it is')
      3.times do
        lyrics = fetcher.pick_lyrics(2)
        expect(lyrics.map(&:value)).to eq ['it', 'is']
      end
    end
  end
end
