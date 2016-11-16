require 'rails_helper'

describe Couplets::SyllableGroup do
  describe '#rhyme_groups' do
    it 'returns the associated sentences grouped by ending rhyme' do
      rhyme1 = double(:sentence)
      rhyme2 = double(:sentence)

      allow(rhyme1).to receive(:rhymes_with?).with(rhyme2).and_return(true)

      syllable_group = Couplets::SyllableGroup.new([rhyme1, rhyme2])
      expect(syllable_group.rhyme_groups).to eq([[rhyme1, rhyme2]])
    end

    it 'ignores sentences that do not rhyme with any other sentences in the group' do
      non_rhyme = double(:sentence)

      allow(non_rhyme).to receive(:rhymes_with?).and_return(false)

      syllable_group = Couplets::SyllableGroup.new([non_rhyme])
      expect(syllable_group.rhyme_groups).to eq([])
    end
  end
end
