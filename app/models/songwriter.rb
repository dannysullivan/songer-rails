class Songwriter
  attr_reader :song

  RHYTHM_MEASURES = 2
  RHYTHMS_PER_SECTION = 2
  BASS_NOTES = [0, 2, 4, 5, 7, 9]
  BEATS_IN_MEASURE = [6, 8]

  MELODY_NOTES = [0, 2, 4, 7, 9]

  def initialize
    beats_in_measure = BEATS_IN_MEASURE.sample
    rhythm1 = create_random_rhythm(beats_in_measure)
    rhythm2 = create_random_rhythm(beats_in_measure)

    @song = Song.create(rhythm1: rhythm1, rhythm2: rhythm2, beats_in_measure: beats_in_measure)

    source_material = File.read(Rails.root.join('config', 'source_material.txt'))
    @lyricist = Lyricist.new(source_material)
  end

  def build_default_sections
    2.times do
      section1 = build_section
      section2 = duplicate_section_with_new_lyrics(section1)
      @song.sections << section1
      @song.sections << section2
    end
    @song.save
    @song.sections
  end

  def build_section
    rhythmic_pattern = RHYTHMS_PER_SECTION.times.map{@song.rhythm1}.join
    melody = create_melody(rhythmic_pattern)
    measures = RHYTHM_MEASURES * RHYTHMS_PER_SECTION
    bass_pattern = measures.times.map{BASS_NOTES.sample}.join('')
    section = Section.new(pattern: melody,
                          bass_pattern: bass_pattern)

    section.lyrics_words = get_lyrics(section.number_of_melody_notes)
    section
  end

  private

  def create_melody(rhythmic_pattern)
    rhythmic_pattern.split('').map do |beat|
      beat == "x" ? MELODY_NOTES.sample.to_s : '.'
    end.join('')
  end

  def get_lyrics(number_of_syllables)
    @lyricist.pick_lyrics(number_of_syllables)
  end

  def duplicate_section_with_new_lyrics(section)
    new_section = Section.duplicate_without_lyrics(section)
    new_section.lyrics_words = get_lyrics(section.number_of_melody_notes)
    new_section
  end

  def create_random_rhythm(beats_in_measure)
    (RHYTHM_MEASURES * beats_in_measure).times.map{['x', '.', '.', '.'].sample}.join
  end
end
