module Couplets; end

class Couplets::SyllableLibrary
  def self.fetch(word)
    SYLLABLES.fetch(word, nil)
  end
end
