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

  def create_lines
    rhyme_groups.each do |rhyme_group|
      group = Couplets::RhymeGroup.find_or_create_for_sentence(rhyme_group.first)
      rhyme_group.each{ |sentence| Couplets::Line.create(rhyme_group: group, text: sentence.text) }
    end
  end
end
