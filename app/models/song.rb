class Song < ActiveRecord::Base
  def to_midi
    midi_song = MIDI::Sequence.new
    meta_track = MIDI::Track.new(midi_song)
    midi_song.tracks << meta_track
    meta_track.events << MIDI::ProgramChange.new(0, 0)

    melody = MIDI::Track.new(midi_song)
    midi_song.tracks << melody

    melody.events << MIDI::NoteOnEvent.new(0, 50, 15)
    melody.events << MIDI::NoteOffEvent.new(0, 50, 15, midi_song.length_to_delta(2/1.0))

    midi_song
    file = File.new('midifile.mid', 'w')
    file.write(midi_song)
    file
  end
end
