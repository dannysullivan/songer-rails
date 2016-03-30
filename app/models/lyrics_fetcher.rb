class LyricsFetcher
  def self.pick_lyrics(number_of_syllables)
    self.pick_lyrics_recursive(number_of_syllables)
  end

  private

  def self.pick_lyrics_recursive(syllables)
    if syllables == 0
      []
    else
      this_word = SYLLABLES.select{|word, syllable_count| syllable_count <= syllables}.keys.sample
      this_word_syllables = SYLLABLES[this_word]

      if this_word
        lyrics_word = LyricsWord.create(value: this_word, syllables: this_word_syllables)
        remaining_syllables = syllables - this_word_syllables
        [lyrics_word] + self.pick_lyrics_recursive(remaining_syllables)
      else # no words found
        raise "Couldn't create a lyric with the requested syllable count"
      end
    end
  end
end
