require 'rails_helper'

describe Couplets::Line do
  describe '#emphasis_pattern' do
    it 'shows the stressed syllables in the line' do
      line = Couplets::Line.new(text: 'This has emphasis')

      word_lookup = double(:word_lookup)
      allow(WordLookup).to receive(:new).and_return(word_lookup)
      allow(word_lookup).to receive(:emphasis).with('THIS').and_return('-')
      allow(word_lookup).to receive(:emphasis).with('HAS').and_return('-')
      allow(word_lookup).to receive(:emphasis).with('EMPHASIS').and_return('-..')
      expect(line.emphasis_pattern).to eq '---..'
    end
  end
end
