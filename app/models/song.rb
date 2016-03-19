class Song < ActiveRecord::Base
  validates_presence_of :rhythm1, :rhythm2
  has_many :sections
  accepts_nested_attributes_for :sections
  after_initialize :set_defaults

  RHYTHM_LENGTH = 16
  RHYTHMS_PER_SECTION = 2
  NUMBER_OF_SECTIONS = 4

  def sections_attributes=(attributes)
    self.sections.create(attributes)
  end

  def measures
    self.melody.length / 8
  end

  def indexed_lyrics
    index = 0
    output = []
    self.sections.each do |section|
      section_output = []
      section.lyrics.split(' ').map do |word|
        section_output << [index, word]
        index += 1
      end
      output << section_output
    end
    output
  end

  def melody
    self.sections.map(&:pattern).join('').split('')
  end

  def bass
    self.sections.map(&:bass_notes).flatten
  end

  def title
    self.sections.first.lyrics.split(' ')[0..1].join(' ').titleize
  end

  def build_default_sections
    2.times do
      section1 = self.build_random_section
      section2 = Section.duplicate_without_lyrics(section1)
      self.sections << section1
      self.sections << section2
    end
    self.save
    self.sections
  end

  def create_random_rhythm
    RHYTHM_LENGTH.times.map{['x', '.', '.', '.'].sample}.join
  end

  def build_random_section
    rhythmic_pattern = RHYTHMS_PER_SECTION.times.map{[self.rhythm1].sample}.join
    self.sections.build(rhythmic_pattern: rhythmic_pattern)
  end

  def set_defaults
    self.rhythm1 = self.rhythm1.presence || create_random_rhythm
    self.rhythm2 = self.rhythm2.presence || create_random_rhythm
  end

  def to_midi
    midi_song = MIDI::Sequence.new
    meta_track = MIDI::Track.new(midi_song)
    midi_song.tracks << meta_track
    meta_track.events << MIDI::ProgramChange.new(0, 0)

    melody = MIDI::Track.new(midi_song)
    bass = MIDI::Track.new(midi_song)
    midi_song.tracks << melody
    midi_song.tracks << bass
    eighth_note_length = midi_song.note_to_delta('eighth')

    melody.events << MIDI::NoteOn.new(0, 0, 127, 0)
    melody.events << MIDI::NoteOff.new(0, 0, 127, eighth_note_length)
    bass.events << MIDI::NoteOn.new(0, 0, 127, 0)
    bass.events << MIDI::NoteOff.new(0, 0, 127, eighth_note_length)

    offset = 0

    self.melody.each do |note|
      if note == "."
        offset += eighth_note_length
      else
        melody_note = 64 + note.to_i
        melody.events << MIDI::NoteOn.new(0, melody_note, 127, offset)
        melody.events << MIDI::NoteOff.new(0, melody_note, 127, eighth_note_length)
        offset = 0
      end
    end

    self.bass.each do |bass_interval|
      note = 40 + bass_interval.to_i
      bass.events << MIDI::NoteOn.new(0, note, 127, 0)
      bass.events << MIDI::NoteOff.new(0, note, 127, eighth_note_length*8)
    end

    file = File.new('midifile.mid', 'wb')
    midi_song.write(file)
    file
  end
end
