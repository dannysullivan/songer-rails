class Song < ActiveRecord::Base
  def to_midi
    midi_song = MIDI::Sequence.new
    meta_track = MIDI::Track.new(midi_song)
    midi_song.tracks << meta_track
    meta_track.events << MIDI::ProgramChange.new(0, 0)

    melody = MIDI::Track.new(midi_song)
    midi_song.tracks << melody
    eighth_note_length = midi_song.note_to_delta('eighth')
    offset = 0

    self.pattern.split('').each do |note|
      if note == "x"
        melody.events << MIDI::NoteOn.new(0, 64, 127, offset)
        melody.events << MIDI::NoteOff.new(0, 64, 127, eighth_note_length)
        offset = 0
      else
        offset += eighth_note_length
      end
    end

    file = File.new('midifile.mid', 'wb')
    midi_song.write(file)
    file
  end
end
