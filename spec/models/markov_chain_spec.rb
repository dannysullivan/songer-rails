require 'spec_helper'
require 'rails_helper'

describe MarkovChain do
  describe '#all_words' do
    it 'returns all words with at least one following word' do
      markov_chain = MarkovChain.new('about it is')
      expect(markov_chain.all_words).to eq ['about', 'it']
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
