class Song < ActiveRecord::Base
  def to_midi
    midi_song = MIDI::Sequence.new
    meta_track = MIDI::Track.new(midi_song)
    midi_song.tracks << meta_track
    meta_track.events << MIDI::ProgramChange.new(0, 0)

    melody = MIDI::Track.new(midi_song)
    midi_song.tracks << melody
    quarter_note_length = midi_song.note_to_delta('quarter')

    melody.events << MIDI::NoteOn.new(0, 50, 127, 0)
    melody.events << MIDI::NoteOff.new(0, 50, 127, quarter_note_length)

    file = File.new('midifile.mid', 'wb')
    midi_song.write(file)
    file
  end
end
