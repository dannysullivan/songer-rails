class Lyricist
  def initialize(source)
    @markov_chain = source
  end

  def pick_lyrics(number_of_syllables, rhyme=nil)
    counter = 5
    begin
      first_word = self.get_first_word(number_of_syllables, rhyme)
      pick_lyrics_recursive(number_of_syllables, first_word)
    rescue => exception
      counter -= 1
      if counter > 0
        retry
      else
        raise exception
      end
    end
  end

  def pick_rhyming_lines(syllables)
    rhymes = @markov_chain.rhymes.select{|array| array.length >= 2}.sample
    2.times.map do
      pick_lyrics_recursive(syllables, rhymes.sample)
    end
  end

  protected

  def get_first_word(syllables, rhyme=nil)
    words = (@markov_chain.all_words - PREPOSITIONS)
    if rhyme
      words = words & Rhymes.rhyme(rhyme).map(&:downcase)
    end
    words.sample
  end

  def get_next_word(word, remaining_syllables)
    words = @markov_chain.next_words(word)
    word = words.select do |word|
      syllables = SyllableLookup.find(word)
      syllables <= remaining_syllables && syllables > 0
    end.sample
    word
  end

  def pick_lyrics_recursive(syllables, current_word)
    if syllables == 0
      []
    else
      if current_word
        current_word_syllables = SyllableLookup.find(current_word)
        lyrics_word = LyricsWord.new(value: current_word, syllables: current_word_syllables)
        remaining_syllables = syllables - current_word_syllables
        next_word = self.get_next_word(current_word, remaining_syllables)
        [lyrics_word] + self.pick_lyrics_recursive(remaining_syllables, next_word)
      else # no words found
        raise "Couldn't create a lyric with the requested syllable count"
      end
    end
  end
end
