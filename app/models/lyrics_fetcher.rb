class LyricsFetcher
  def self.pick_lyrics(number_of_syllables)
    unless Word.first
      raise "No words in database"
    end

    self.pick_lyrics_recursive(number_of_syllables)
  end

  private

  def self.pick_lyrics_recursive(syllables)
    if syllables == 0
      []
    else
      this_word = Word.where("syllables <= ?", syllables).to_a.sample

      if this_word
        this_word = Word.where("syllables <= ?", syllables).to_a.sample
        remaining_syllables = syllables - this_word.syllables
        [this_word] + self.pick_lyrics_recursive(remaining_syllables)
      else # no words found
        raise "Couldn't create a lyric with the requested syllable count"
      end
    end
  end
end
