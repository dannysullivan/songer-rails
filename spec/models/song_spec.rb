require 'spec_helper'
require 'rails_helper'

describe 'Song' do
  describe 'creating with defaults' do
    it 'generates rhythms if none are provided' do
      song = Song.new
      expect(song.rhythm1).to be
      expect(song.rhythm2).to be
    end
  end

  describe '#melody' do
    it 'returns an array of notes' do
      song = create(:song)
      song.sections.build(pattern: '0.0.')

      expect(song.melody).to eq (['0', '.', '0', '.'])
    end
  end

  describe '#bass' do
    it 'returns an array of bass notes' do
      song = build(:song)
      section = build(:section, bass_pattern: '0575')
      song.sections << section

      expect(song.bass).to eq ['0', '5', '7', '5']
    end
  end

  describe '#indexed_lyrics' do
    it 'returns indexed lyrics, split accross multiple lines' do
      song = Song.new
      2.times do
        song.sections.build({lyrics: "la la la"})
      end
      expect(song.indexed_lyrics).to eq [[[0, 'la'], [1, 'la'], [2, 'la']], [[3, 'la'], [4, 'la'], [5, 'la']]]
    end
  end
end
