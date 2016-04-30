class Songwriter
  attr_reader :song
  attr_reader :verse_melody
  attr_reader :chorus_melody
  attr_reader :chorus_lyrics

  RHYTHM_MEASURES = 1
  RHYTHMS_PER_SECTION = 4
  BASS_NOTES = [0, 2, 4, 5, 7, 9]
  BEATS_IN_MEASURE = [6, 8]

  MELODY_NOTES = [0, 2, 4, 7, 9]

  def initialize(lyricist)
    beats_in_measure = BEATS_IN_MEASURE.sample
    rhythm1 = create_random_rhythm(beats_in_measure)
    rhythm2 = create_random_rhythm(beats_in_measure)

    @lyricist = lyricist
    rhythmic_pattern = RHYTHMS_PER_SECTION.times.map{rhythm1}.join
    @verse_melody = self.build_section(rhythmic_pattern)

    @chorus_melody = self.build_section(rhythmic_pattern)
    number_of_beats = @chorus_melody.number_of_melody_notes
    @chorus_lyrics = @lyricist.pick_rhyming_lines(number_of_beats)

    @song = Song.create(rhythm1: rhythm1, rhythm2: rhythm2, beats_in_measure: beats_in_measure)
  end

  def build_default_sections
    self.write_verse
    self.write_verse

    self.write_chorus
    self.write_chorus

    @song.save
    @song.sections
  end

  def write_chorus
    line1 = duplicate_section(self.chorus_melody)
    line2 = duplicate_section(self.chorus_melody)

    line1.lyrics_words = @chorus_lyrics.first.map(&:dup).reverse
    line2.lyrics_words = @chorus_lyrics.second.map(&:dup).reverse

    @song.sections << line1
    @song.sections << line2

    line2
  end

  def write_verse
    verse_melody = self.verse_melody
    number_of_beats = verse_melody.number_of_melody_notes
    lyrics = @lyricist.pick_rhyming_lines(number_of_beats)

    line1 = duplicate_section(verse_melody)
    line2 = duplicate_section(verse_melody)

    line1.lyrics_words = lyrics.first.reverse
    line2.lyrics_words = lyrics.second.reverse

    @song.sections << line1
    @song.sections << line2

    line2
  end

  def build_part_of_song(rhythms_available)
    rhythmic_pattern = RHYTHMS_PER_SECTION.times.map{rhythms_available.sample}.join
    section1 = build_section(rhythmic_pattern)
    section2 = duplicate_section(section1)

    number_of_beats = section1.number_of_melody_notes
    lyrics = @lyricist.pick_rhyming_lines(number_of_beats)

    section1.lyrics_words = lyrics.first.reverse
    section2.lyrics_words = lyrics.second.reverse
    @song.sections << section1
    @song.sections << section2
  end

  def build_section(rhythmic_pattern)
    melody = create_melody(rhythmic_pattern)
    measures = RHYTHM_MEASURES * RHYTHMS_PER_SECTION
    bass_pattern = measures.times.map{BASS_NOTES.sample}.join('')
    Section.new(pattern: melody, bass_pattern: bass_pattern)
  end

  private

  def create_melody(rhythmic_pattern)
    last_note_index = (0..MELODY_NOTES.length).to_a.sample
    rhythmic_pattern.split('').map do |beat|
      if beat == "x"
        movement_options = [0]
        movement_options << -1 unless last_note_index == 0
        movement_options << 1 unless last_note_index == MELODY_NOTES.length - 1
        movement = movement_options.sample
        last_note_index = (last_note_index + movement) % MELODY_NOTES.length
        MELODY_NOTES[last_note_index].to_s
      else
        '.'
      end
    end.join('')
  end

  def get_lyrics(number_of_syllables, rhyme=nil)
    @lyricist.pick_lyrics(number_of_syllables, rhyme).reverse
  end

  def duplicate_section(section)
    Section.duplicate_without_lyrics(section)
  end

  def create_random_rhythm(beats_in_measure)
    rhythm = (RHYTHM_MEASURES * beats_in_measure).times.map{['x', '.', '.', '.'].sample}.join
    if rhythm.split('').uniq == ['.']
      random_beat = (0..rhythm.length).to_a.sample
      rhythm[random_beat] = 'x'
    end
    rhythm
  end
end
