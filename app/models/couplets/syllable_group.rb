module Couplets; end

class Couplets::SyllableGroup
  attr_reader :syllables, :sentences

  def initialize(syllables, sentences)
    @syllables = syllables
    @sentences = sentences
  end

  def rhyme_groups
    groups = []
    sentences.each do |sentence|
      existing_group = groups.detect{ |group| group.first.rhymes_with?(sentence) }
      if existing_group
        existing_group << sentence
      else
        groups << [sentence]
      end
    end

    groups.reject{ |group| group.length == 1 }
  end
end
