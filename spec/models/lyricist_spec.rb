require 'spec_helper'
require 'rails_helper'

describe Lyricist do
  describe '#pick_lyrics' do
    it 'picks lyrics based on the training text' do
      lyricist = Lyricist.new('it is')
      3.times do
        lyrics = lyricist.pick_lyrics(2)
        expect(lyrics.map(&:value)).to eq ['it', 'is']
      end
    end

    it 'removes capital letters and punctuation from the source' do
      lyricist = Lyricist.new('It. Is')
      3.times do
        lyrics = lyricist.pick_lyrics(2)
        expect(lyrics.map(&:value)).to eq ['it', 'is']
      end
    end
  end
end
