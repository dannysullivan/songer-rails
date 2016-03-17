require 'spec_helper'
require 'rails_helper'

describe 'creating with defaults' do
  it 'generates rhythms if none are provided' do
    song = Song.new
    expect(song.rhythm1).to be
    expect(song.rhythm2).to be
  end
end
