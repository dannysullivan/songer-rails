class Lyricist
  def initialize(source)
    @markov_chain = MarkovChain.new(source)
  end

  def pick_lyrics(number_of_syllables)
    first_word = self.get_first_word(number_of_syllables)
    pick_lyrics_recursive(number_of_syllables, first_word)
  end

  protected

  def get_first_word(syllables)
    word_value = @markov_chain.random_word
    Word.where(value: word_value).first
  end

  def get_next_word(word, remaining_syllables)
    word_value = @markov_chain.next_words(word).sample
    Word.where(value: word_value).first
  end

  def pick_lyrics_recursive(syllables, current_word)
    if syllables == 0
      []
    else
      if current_word
        lyrics_word = LyricsWord.create(value: current_word.value, syllables: current_word.syllables)
        remaining_syllables = syllables - current_word.syllables
        next_word = self.get_next_word(current_word.value, remaining_syllables)
        [lyrics_word] + self.pick_lyrics_recursive(remaining_syllables, next_word)
      else # no words found
        raise "Couldn't create a lyric with the requested syllable count"
      end
    end
  end
end
