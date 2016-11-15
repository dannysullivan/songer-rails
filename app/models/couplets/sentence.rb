module Couplets; end

class Couplets::Sentence
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def syllable_count
    words = @text.split(' ')

    words.sum do |word|
      syllables = Couplets::SyllableLibrary.fetch(word.downcase)
      return unless syllables
      syllables
    end
  end
end
