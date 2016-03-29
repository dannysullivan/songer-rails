class MarkovChain
  def initialize(source)
    @hash = {}
    words = source.split(' ')
    words.each_cons(2) do |slice|
      first_word, second_word = slice
      if @hash.key?(first_word)
        @hash[first_word] << second_word
      else
        @hash[first_word] = [second_word]
      end
    end
  end

  def next_words(word)
    @hash[word] || []
  end

  def random_word
    @hash.keys.sample
  end
end
