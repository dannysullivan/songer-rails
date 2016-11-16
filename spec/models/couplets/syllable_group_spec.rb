require 'rails_helper'

describe Couplets::SyllableGroup do
  describe '#rhyme_groups' do
    it 'returns the associated sentences grouped by ending rhyme' do
      rhyme1 = double(:sentence)
      rhyme2 = double(:sentence)

      allow(rhyme1).to receive(:rhymes_with?).with(rhyme2).and_return(true)

      syllable_group = Couplets::SyllableGroup.new(2, [rhyme1, rhyme2])
      expect(syllable_group.rhyme_groups).to eq([[rhyme1, rhyme2]])
    end

    it 'ignores sentences that do not rhyme with any other sentences in the group' do
      non_rhyme = double(:sentence)

      allow(non_rhyme).to receive(:rhymes_with?).and_return(false)

      syllable_group = Couplets::SyllableGroup.new(2, [non_rhyme])
      expect(syllable_group.rhyme_groups).to eq([])
    end
  end

  describe '#create_lines' do
    it 'creates Couplet::Line records for all lines in rhyme_groups' do
      rhyme1 = double(:sentence, text: 'first rhyme', syllable_count: 2)
      rhyme2 = double(:sentence, text: 'second rhyme', syllable_count: 2)

      allow(rhyme1).to receive(:rhymes_with?).with(rhyme2).and_return(true)

      group = double(:rhyme_group)
      expect(Couplets::RhymeGroup).to receive(:find_or_create_for_sentence).with(rhyme1).and_return(group)

      expect(Couplets::Line).to receive(:create).with({
        rhyme_group: group,
        text: 'first rhyme'
      })
      expect(Couplets::Line).to receive(:create).with({
        rhyme_group: group,
        text: 'second rhyme'
      })
      Couplets::SyllableGroup.new(2, [rhyme1, rhyme2]).create_lines
    end
  end
end
