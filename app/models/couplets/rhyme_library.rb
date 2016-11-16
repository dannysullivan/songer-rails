module Couplets; end

class Couplets::RhymeLibrary
  def self.check_rhyme(first_word, second_word)
    return false unless first_word && second_word
    rhymer.rhyme(first_word.downcase).map(&:downcase).include?(second_word.downcase)
  rescue Rhymes::UnknownWord
    false
  end

  private

  def self.rhymer
    @rhymer ||= Rhymes.new
  end
end
