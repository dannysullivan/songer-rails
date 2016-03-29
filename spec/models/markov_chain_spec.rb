require 'spec_helper'
require 'rails_helper'

describe MarkovChain do
  describe '#random_word' do
    it 'returns a random word with at least one following word' do
      markov_chain = MarkovChain.new('it is')
      expect(markov_chain.random_word).to eq 'it'

      markov_chain = MarkovChain.new('it is this')
      expect(['it', 'is']).to include markov_chain.random_word
    end
  end

  describe '#next_words' do
    it 'returns all words following the given word in the source' do
      markov_chain = MarkovChain.new('it is it does')
      expect(markov_chain.next_words('it')).to eq ['is', 'does']
      expect(markov_chain.next_words('is')).to eq ['it']
      expect(markov_chain.next_words('does')).to eq []
    end
  end
end
