class Song < ActiveRecord::Base
  validates_presence_of :pattern

  def bass_notes
    [0, 5]
  end

  def melody_notes
    [0, 2, 4, 7, 9]
  end

  def measures
    self.pattern.length / 8
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
    offset = 0

    self.pattern.split('').each do |note|
      if note == "x"
        melody_note = 64 + self.melody_notes.sample
        melody.events << MIDI::NoteOn.new(0, melody_note, 127, offset)
        melody.events << MIDI::NoteOff.new(0, melody_note, 127, eighth_note_length)
        offset = 0
      else
        offset += eighth_note_length
      end
    end

    bass_notes.cycle(self.measures/2) do |bass_interval|
      note = 40 + bass_interval
      bass.events << MIDI::NoteOn.new(0, note, 127, 0)
      bass.events << MIDI::NoteOff.new(0, note, 127, eighth_note_length*8)
    end

    file = File.new('midifile.mid', 'wb')
    midi_song.write(file)
    file
  end
end
