module Couplets; end

class Couplets::Sentence
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def syllable_count
    words = text.split(' ')

    words.sum do |word|
      syllables = Couplets::SyllableLibrary.fetch(word.downcase)
      return unless syllables
      syllables
    end
  end

  def rhymes_with?(other_sentence)
    Couplets::RhymeLibrary.check_rhyme(text.split(' ').last, other_sentence.text.split(' ').last)
  end
end
