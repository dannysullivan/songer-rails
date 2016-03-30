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
    word = @markov_chain.random_word
  end

  def get_next_word(word, remaining_syllables)
    word = @markov_chain.next_words(word).sample
  end

  def pick_lyrics_recursive(syllables, current_word)
    if syllables == 0
      []
    else
      if current_word
        lyrics_word = LyricsWord.create(value: current_word, syllables: SYLLABLES[current_word])
        remaining_syllables = syllables - SYLLABLES[current_word]
        next_word = self.get_next_word(current_word, remaining_syllables)
        [lyrics_word] + self.pick_lyrics_recursive(remaining_syllables, next_word)
      else # no words found
        raise "Couldn't create a lyric with the requested syllable count"
      end
    end
  end
end
