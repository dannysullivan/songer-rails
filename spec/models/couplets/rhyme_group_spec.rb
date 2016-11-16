require 'rails_helper'

describe Couplets::RhymeGroup do
  describe '.find_or_create_for_sentence' do
    context 'when the sentence does not fit into an existing RhymeGroup' do
      it 'creates a new RhymeGroup' do
        sentence = double(:sentence, syllable_count: 2, text: 'some text')

        expect(described_class).to receive(:create).with({
          syllables: 2,
        })

        described_class.find_or_create_for_sentence(sentence)
      end
    end

    context 'when the sentence does fit into an existing RhymeGroup' do
      it 'returns that RhymeGroup' do
        allow(Couplets::RhymeLibrary).to receive(:check_rhyme).with('next', 'text').and_return(true)
        group = Couplets::RhymeGroup.create(syllables: 2, lines: [FactoryGirl.create(:line, text: 'the next')])
        sentence = double(:sentence, syllable_count: 2, text: 'some text')

        expect(described_class.find_or_create_for_sentence(sentence)).to eq group
      end
    end
  end
end
