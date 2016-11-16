require 'rails_helper'

describe 'Couplets::RhymeLibrary' do
  describe '.check_rhyme' do
    it 'returns true if the words rhyme and false if not' do
      rhymer = double(:rhymer)
      allow(Rhymes).to receive(:new).and_return(rhymer)
      allow(rhymer).to receive(:rhyme).with('test').and_return(['REST', 'LEST'])

      expect(Couplets::RhymeLibrary.check_rhyme('Test', 'rest')).to eq true
      expect(Couplets::RhymeLibrary.check_rhyme('Test', 'other')).to eq false
    end
  end
end
