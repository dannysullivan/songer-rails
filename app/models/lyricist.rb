class Lyricist
  def self.from_source_file(file_name)
    source = File.read(Rails.root.join('config', 'sources', "#{file_name}.txt"))
    self.from_source(source)
  end

  def self.from_source(source)
    source = source.downcase.gsub(/[^a-z\s]/i, '')
    source = source.split(' ').reverse.join(' ')

    markov_chain = MarkovChain.new(source)
    self.new(markov_chain)
  end

  def initialize(source)
    @markov_chain = source
  end

  def rhyming_lines_string(syllables)
    lyrics = pick_rhyming_lines(syllables)
    lyrics.map{ |lyrics_words| lyrics_words.map(&:value).join(' ') }.join("\n")
  end

  def pick_rhyming_lines(syllables)
    rhymes = @markov_chain.rhymes.select{|array| array.length >= 2}.shuffle
    lyrics = []
    rhymes.detect do |rhyme_group|
      lyrics = []
      first_line = lyrics_from_group(rhyme_group, syllables)
      if first_line
        second_line = lyrics_from_group(rhyme_group - [first_line.first.value], syllables)
        lyrics = [first_line, second_line].compact
      end

      lyrics.length == 2
    end

    lyrics.map(&:reverse)
  end

  protected

  def lyrics_from_group(group, syllables)
    lyrics = nil
    group.shuffle.detect do |word|
      lyrics_word = LyricsWord.new(value: word, syllables: SyllableLookup.find(word))
      lyrics = self.lyrics_from_word(syllables, lyrics_word)
    end
    lyrics
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
