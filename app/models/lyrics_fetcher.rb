class LyricsFetcher
  def self.pick_lyrics(number_of_syllables)
    unless Word.first
      raise "No words in database"
    end

    lyrics = []
    one_syllable_words = Word.where(syllables: 1)
    number_of_syllables.times do
      lyrics << one_syllable_words.sample.value
    end
    lyrics
  end
end
