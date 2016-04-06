class Lyricist
  def initialize(source)
    @markov_chain = source
  end

  def pick_rhyming_lines(syllables)
    rhymes = @markov_chain.rhymes.select{|array| array.length >= 2}.shuffle
    lyrics = []
    rhymes.detect do |rhyme_group|
      lyrics = []
      2.times do
        rhyme_group.shuffle.detect do |word|
          lyrics_word = LyricsWord.new(value: word, syllables: SyllableLookup.find(word))
          next_lyrics = self.lyrics_from_word(syllables, lyrics_word)
          lyrics << next_lyrics if next_lyrics
        end
      end

      lyrics.length == 2
    end

    lyrics
  end

  protected

  def get_first_word(syllables, rhyme=nil)
    words = (@markov_chain.all_words - PREPOSITIONS)
    if rhyme
      words = words & Rhymes.rhyme(rhyme).map(&:downcase)
    end
    words.sample
  end

  def next_lyrics_words(word)
    @markov_chain.next_words(word).map do |word|
      syllables = SyllableLookup.find(word)
      if syllables > 0
        LyricsWord.new(value: word, syllables: syllables)
      end
    end
  end

  def lyrics_from_word(syllables, current_word)
    if syllables == 0
      []
    elsif syllables < 0 || current_word.nil?
      false
    else
      next_lyrics = nil
      next_words = self.next_lyrics_words(current_word.value)
      next_words.shuffle.detect do |next_word|
        remaining_syllables = syllables - current_word.syllables
        next_lyrics = self.lyrics_from_word(remaining_syllables, next_word)
      end

      [current_word] + next_lyrics if next_lyrics
    end
  end
end
