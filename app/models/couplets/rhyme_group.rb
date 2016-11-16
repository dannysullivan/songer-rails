module Couplets; end

class Couplets::RhymeGroup < ActiveRecord::Base
  has_many :lines

  def self.find_or_create_for_sentence(sentence)
    syllable_matches = self.where(syllables: sentence.syllable_count)
    rhyme_match = syllable_matches.detect do |group|
      group_sentence = Couplets::Sentence.new(group.lines.first.text)
      group_sentence.rhymes_with?(sentence)
    end

    return rhyme_match if rhyme_match
    self.create(syllables: sentence.syllable_count)
  end
end
