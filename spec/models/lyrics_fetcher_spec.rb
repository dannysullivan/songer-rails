require 'spec_helper'
require 'rails_helper'

describe '#pick_lyrics' do
  it 'picks random lyrics to fit the given number of syllables' do
    lyrics = LyricsFetcher.pick_lyrics(4)
    expect(lyrics.length).to eq 4
  end
end
