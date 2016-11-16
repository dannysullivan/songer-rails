require 'rails_helper'

describe Couplets::Sentence do
  describe '#syllable_count' do
    it 'returns the number of syllables in the sentence' do
      allow(Couplets::SyllableLibrary).to receive(:fetch).with('here').and_return(1)
      allow(Couplets::SyllableLibrary).to receive(:fetch).with('it').and_return(1)
      allow(Couplets::SyllableLibrary).to receive(:fetch).with('is').and_return(1)
      sentence = Couplets::Sentence.new('Here it is')

      expect(sentence.syllable_count).to eq 3
    end

    it 'returns nil if the syllables cannot be counted' do
      allow(Couplets::SyllableLibrary).to receive(:fetch).with('fake').and_return(nil)
      sentence = Couplets::Sentence.new('fake')

      expect(sentence.syllable_count).to be_nil
    end
  end

  describe '#rhymes_with' do
    it 'returns true if the last words of the sentences rhyme' do
      allow(Couplets::RhymeLibrary).to receive(:check_rhyme).with('rhyme', 'time').and_return(true)

      sentence = Couplets::Sentence.new('this is rhyme')
      rhyme = Couplets::Sentence.new('all the time')
      expect(sentence.rhymes_with?(rhyme)).to eq true
    end

    it 'returns false if the last words of the sentences do not rhyme' do
      allow(Couplets::RhymeLibrary).to receive(:check_rhyme).with('rhyme', 'nope').and_return(false)

      sentence = Couplets::Sentence.new('this is rhyme')
      rhyme = Couplets::Sentence.new('all the nope')
      expect(sentence.rhymes_with?(rhyme)).to eq false
    end
  end
end
