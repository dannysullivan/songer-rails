class SyllableLookup
  def self.find(word)
    SYLLABLES[word] || 0
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
      length -= 1
    end

    puts "#{word}: #{length}"
    return length
  end
end
