require 'spec_helper'
require 'rails_helper'

describe Songwriter do
  describe '#initialize' do
    it 'creates a song with a random rhythmic pattern' do
      songwriter = Songwriter.new
      song = songwriter.song
      expect(song.rhythm1.length).to be 16
    end
  end

  describe '#build_default_sections' do
    it 'plays two sections twice each' do
      songwriter = Songwriter.new
      songwriter.build_default_sections
      song = songwriter.song
      expect(song.sections.length).to eq 4
      first_section = song.sections.first
      second_section = song.sections.second
      expect(first_section.pattern).to eq second_section.pattern
      expect(first_section.bass_notes).to eq second_section.bass_notes
    end
  end
end
