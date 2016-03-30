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

  describe '#build_section' do
    it 'picks the right number of bass notes' do
      songwriter = Songwriter.new
      section = songwriter.build_section
      expect(section.bass_notes.length).to eq 4
    end

    it 'sets lyrics to an array of words' do
      stub_const('SYLLABLES', {test: 1})
      songwriter = Songwriter.new
      section = songwriter.build_section
      notes = section.number_of_melody_notes
      expect(section.lyrics_words.map(&:value)).to include 'test'
      expect(section.lyrics_words.map(&:syllables).sum).to eq notes
    end

    it 'picks notes for the melody' do
      stub_const('Songwriter::MELODY_NOTES', [0])
      songwriter = Songwriter.new
      section = songwriter.build_section
      expect(section.pattern.split('')).to include '0'
      expect(section.pattern.split('')).to include '.'
    end
  end
end
