require 'rails_helper'

describe Lyric do
  describe '#lines' do
    it 'interleaves the lines from two rhyme groups' do
      line1 = double(:line1)
      line2 = double(:line2)
      line3 = double(:line3)
      line4 = double(:line4)

      group1 = double(:group1, lines: [line1, line3])
      group2 = double(:group2, lines: [line2, line4])

      query_result = double(:query_result)
      allow(query_result).to receive(:sample).with(2).and_return([group1, group2])
      allow(Couplets::RhymeGroup).to receive(:where).with('syllables > 4 AND syllables <= 8').and_return(query_result)

      expect(described_class.new.lines).to eq [line1, line2, line3, line4]
    end

    it 'only interleaves two pairs of lines' do
      line1 = double(:line1)
      line2 = double(:line2)
      line3 = double(:line3)
      line4 = double(:line4)
      line5 = double(:line5)
      line6 = double(:line6)

      group1 = double(:group1, lines: [line1, line3, line5])
      group2 = double(:group2, lines: [line2, line4, line6])

      query_result = double(:query_result)
      allow(query_result).to receive(:sample).with(2).and_return([group1, group2])
      allow(Couplets::RhymeGroup).to receive(:where).with('syllables > 4 AND syllables <= 8').and_return(query_result)

      expect(described_class.new.lines).to eq [line1, line2, line3, line4]
    end
  end
end
