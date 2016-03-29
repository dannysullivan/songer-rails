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

  describe '#build_default_sections' do
    it 'plays two sections twice each' do
      create(:word)
      song = create(:song)
      song.build_default_sections
      expect(song.sections.length).to eq 4
      first_section = song.sections.first
      second_section = song.sections.second
      expect(first_section.pattern).to eq second_section.pattern
      expect(first_section.bass_notes).to eq second_section.bass_notes
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
      create(:word)
      song = build(:song)
      section = build(:section, bass_pattern: '0575')
      song.sections << section

      expect(song.bass).to eq ['0', '5', '7', '5']
    end
  end
end
