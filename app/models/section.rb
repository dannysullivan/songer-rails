class Section < ActiveRecord::Base
  belongs_to :song
  has_many :lyrics_words

  attr_reader :rhythmic_pattern

  NOTES = [0,2,4,7,9]

  def self.duplicate_without_lyrics(section)
    Section.new(pattern: section.pattern, bass_pattern: section.bass_pattern)
  end

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
    rhythmic_pattern
  end

  def bass_notes
    self.bass_pattern.split('')
  end

  def number_of_melody_notes
    self.pattern.split('').count{|beat| beat!="."}
  end

  def lyrics
    self.lyrics_words.map(&:value).join(' ')
  end
end
