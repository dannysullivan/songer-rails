class Songwriter
  attr_reader :song

  RHYTHM_LENGTH = 16
  RHYTHMS_PER_SECTION = 2

  def initialize
    rhythm1 = create_random_rhythm
    rhythm2 = create_random_rhythm

    @song = Song.create(rhythm1: rhythm1, rhythm2: rhythm2)
  end

  def build_default_sections
    2.times do
      section1 = build_random_section
      section2 = Section.duplicate_without_lyrics(section1)
      @song.sections << section1
      @song.sections << section2
    end
    @song.save
    @song.sections
  end

  private

  def build_random_section
    rhythmic_pattern = RHYTHMS_PER_SECTION.times.map{@song.rhythm1}.join
    Section.new(rhythmic_pattern: rhythmic_pattern)
  end

  def create_random_rhythm
    RHYTHM_LENGTH.times.map{['x', '.', '.', '.'].sample}.join
  end
end
