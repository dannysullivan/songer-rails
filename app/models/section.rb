class Section < ActiveRecord::Base
  belongs_to :song

  before_save :create_lyrics

  def number_of_melody_notes
    self.pattern.split('').count{|beat| beat=="x"}
  end

  def create_lyrics
    unless self.lyrics.present?
      self.lyrics = LyricsFetcher.pick_lyrics(self.number_of_melody_notes).join(' ')
    end
  end
end
