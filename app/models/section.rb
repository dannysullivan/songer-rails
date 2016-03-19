class Section < ActiveRecord::Base
  belongs_to :song

  before_save :set_default_lyrics
  before_save :set_default_bass
  attr_reader :rhythmic_pattern

  NOTES = [0,2,4,7,9]
  BASS_NOTES = [0,2,4,5,7,9]
  BEATS_PER_MEASURE = 8

  def rhythmic_pattern=(rhythmic_pattern)
    pattern = ""
    rhythmic_pattern.split('').each do |beat|
      if beat == "x"
        pattern += NOTES.sample.to_s
      else
        pattern += '.'
      end
    end

    self.pattern = pattern
  end

  def measures
    self.pattern.length/BEATS_PER_MEASURE
  end

  def bass_notes
    self.bass_pattern.split('')
  end

  def number_of_melody_notes
    self.pattern.split('').count{|beat| beat!="."}
  end

  def set_default_lyrics
    unless self.lyrics.present?
      self.lyrics = LyricsFetcher.pick_lyrics(self.number_of_melody_notes).join(' ')
    end
  end

  def set_default_bass
    unless self.bass_pattern
      bass_pattern = self.measures.times.map{|index| BASS_NOTES.sample}.join
      self.bass_pattern = bass_pattern
    end
  end
end
