require 'spec_helper'
require 'rails_helper'

describe '#pick_lyrics' do
  it 'picks random lyrics to fit the given number of syllables' do
    create(:word, value: 'test', syllables: 1)
    lyrics = LyricsFetcher.pick_lyrics(2)
    expect(lyrics).to eq ['test', 'test']
  end
end
