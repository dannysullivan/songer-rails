require 'rails_helper'

describe Source do
  describe '#accidental_couplets' do
    it 'returns all rhyming lines of the same length in source' do
      source = Source.new(
        text: 'Here is a rhyme. This one is not one. All of the time.'
      )
      couplets = source.accidental_couplets
      expect(couplets).to eq ['Here is a rhyme / All of the time']
    end
  end
end
