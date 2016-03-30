class SyllableLookup
  def self.find(word)
    SYLLABLES[word] || count_syllables(word)
  end

  private

  def self.count_syllables(word)
    length = 0
    if word[-3..-1] == 'ing'
      length += 1
      word = word[0...-3]
    end

    tokenizer = /([aeiouy]{1,3})/
    got = word.scan(tokenizer)
    length += got.size()

    if got.size() > 1 and got[-1] == ['e'] and
                  word[-1].chr() == 'e' and
                  word[-2].chr() != 'l'
      length -= 1
    elsif got.size() > 1 and word[-2..-1] == 'ed'
      puts "here"
      length -= 1
    end

    return length
  end
end
