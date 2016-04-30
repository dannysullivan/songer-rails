require 'spec_helper'
require 'rails_helper'

describe Songwriter do
  before do
    allow_any_instance_of(Lyricist).to receive(:pick_rhyming_lines)
      .and_return([[build(:lyrics_word)], [build(:lyrics_word)]])
    source_material = MarkovChain.new('here are some test lyrics to try')
    @lyricist = Lyricist.new(source_material)
  end

  describe '#initialize' do
    it 'creates a song with a random rhythmic pattern' do
      songwriter = Songwriter.new(@lyricist)
      song = songwriter.song
      beats_in_measure = song.beats_in_measure
      expect(song.rhythm1.length).to be beats_in_measure
      expect(song.rhythm2.length).to be beats_in_measure
    end
  end

  describe '#build_default_sections' do
    it 'writes 8 lines total' do
      songwriter = Songwriter.new(@lyricist)
      songwriter.build_default_sections
      song = songwriter.song
      expect(song.sections.length).to eq 8
      first_section = song.sections.first
      second_section = song.sections.second
      expect(first_section.pattern).to eq second_section.pattern
      expect(first_section.bass_notes).to eq second_section.bass_notes
    end
  end

  describe '#build_section' do
    it 'picks the right number of bass notes' do
      songwriter = Songwriter.new(@lyricist)
      section = songwriter.build_section('x...x...x...x...')
      expect(section.bass_notes.length).to eq 4
    end

    it 'picks notes for the melody' do
      stub_const('Songwriter::MELODY_NOTES', [0])
      songwriter = Songwriter.new(@lyricist)
      section = songwriter.build_section('xxxxxx..')
      expect(section.pattern.split('')).to include '0'
      expect(section.pattern.split('')).to include '.'
    end
  end

  describe '#add_verse' do
    it 'copies the verse melody but writes new lyrics' do
      songwriter = Songwriter.new(@lyricist)
      expect(songwriter.verse_melody).to be
      verse = songwriter.write_verse
      expect(verse.pattern).to eq songwriter.verse_melody.pattern
      expect(verse.bass_notes).to eq songwriter.verse_melody.bass_notes
      expect(verse.lyrics.length > 0).to be true
    end
  end

  describe '#add_chorus' do
    it 'copies the chorus melody and lyrics' do
      songwriter = Songwriter.new(@lyricist)
      expect(songwriter.chorus_melody).to be
      expect(songwriter.chorus_lyrics).to be
      chorus = songwriter.write_chorus

      expect(chorus.pattern).to eq songwriter.chorus_melody.pattern
      expect(chorus.bass_notes).to eq songwriter.chorus_melody.bass_notes
      expect(chorus.lyrics).to eq songwriter.chorus_lyrics.last.map(&:value).join
    end
  end
end
