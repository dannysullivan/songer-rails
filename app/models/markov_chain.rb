class MarkovChain

  def rhymes
    @rhymes.map(&:uniq)
  end

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

    process_rhymes
  end

  def next_words(word)
    @hash[word] || []
  end

  def all_words
    @hash.keys
  end

  def self.load(file)
    marshal = File.read(file)
    Marshal.load(marshal)
  end

  private

  def process_rhymes
    @rhymes = []
    words = @hash.keys
    rhymer = Rhymes.new
    unprocessed_words = words
    words.each_with_index do |word, index|
      if unprocessed_words.include?(word)
        rhymes = [word]
        begin
          rhymes += unprocessed_words & rhymer.rhyme(word).map(&:downcase)
        rescue
        end
        @rhymes << rhymes
        unprocessed_words -= rhymes
      end
    end
  end
end
