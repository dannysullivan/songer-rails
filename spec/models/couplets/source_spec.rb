require 'rails_helper'

describe Couplets::Source do
  describe '#sentences' do
    it 'creates a Couplets::Sentence for each sentence in the given text' do
      expect(Couplets::Sentence).to receive(:new).exactly(3).times.with('Sentence')
      Couplets::Source.new(text: 'Sentence. Sentence. Sentence.').sentences
    end
  end

  describe '#syllable_groups' do
    it 'returns the associated sentences grouped by syllable count' do
      one_syllable_sentence = double(:sentence, syllable_count: 1)
      two_syllable_sentence1 = double(:sentence, syllable_count: 2)
      two_syllable_sentence2 = double(:sentence, syllable_count: 2)

      allow(Couplets::Sentence).to receive(:new).with('One syllable').and_return(one_syllable_sentence)
      allow(Couplets::Sentence).to receive(:new).with('Two syllables 1').and_return(two_syllable_sentence1)
      allow(Couplets::Sentence).to receive(:new).with('Two syllables 2').and_return(two_syllable_sentence2)

      group1 = double(:syllable_group)
      group2 = double(:syllable_group)

      allow(Couplets::SyllableGroup).to receive(:new).with([one_syllable_sentence]).and_return(group1)
      allow(Couplets::SyllableGroup).to receive(:new).with([
        two_syllable_sentence1,
        two_syllable_sentence2
      ]).and_return(group2)

      source = Couplets::Source.new(text: 'One syllable. Two syllables 1. Two syllables 2.')
      expect(source.syllable_groups).to eq({
        1 => group1,
        2 => group2
      })
    end

    it 'disregards sentences with uncountable syllables' do
      sentence = double(:sentence, syllable_count: nil)

      allow(Couplets::Sentence).to receive(:new).with('Fakeword').and_return(sentence)

      source = Couplets::Source.new(text: 'Fakeword')
      expect(source.syllable_groups).to eq({})
    end
  end
end
