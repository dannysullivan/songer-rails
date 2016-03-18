class Section < ActiveRecord::Base
  belongs_to :song

  before_save :create_lyrics
  attr_reader :rhythmic_pattern

  NOTES = [0,2,4,7,9]

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

  def number_of_melody_notes
    self.pattern.split('').count{|beat| beat!="."}
  end

  def create_lyrics
    unless self.lyrics.present?
      self.lyrics = LyricsFetcher.pick_lyrics(self.number_of_melody_notes).join(' ')
    end
  end
end
