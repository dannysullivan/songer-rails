require 'spec_helper'
require 'rails_helper'

describe Lyricist do
  describe '#pick_lyrics' do
    it 'picks lyrics based on the training text' do
      fetcher = Lyricist.new('it is')
      3.times do
        lyrics = fetcher.pick_lyrics(2)
        expect(lyrics.map(&:value)).to eq ['it', 'is']
      end
    end
  end
end
