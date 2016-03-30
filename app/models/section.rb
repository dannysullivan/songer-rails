class Section < ActiveRecord::Base
  belongs_to :song
  has_many :lyrics_words

  def self.duplicate_without_lyrics(section)
    Section.new(pattern: section.pattern, bass_pattern: section.bass_pattern)
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
