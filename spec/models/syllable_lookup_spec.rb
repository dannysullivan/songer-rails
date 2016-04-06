require 'spec_helper'
require 'rails_helper'

describe SyllableLookup do
  context 'for word that is in config' do
    it 'gets the syllable count from the config' do
      stub_const('SYLLABLES', {'test' => 1})
      expect(SyllableLookup.find('test')).to eq 1
    end
  end

  context 'for word that is not in config' do
    it 'returns 0' do
      stub_const('SYLLABLES', {'test' => 1})
      expect(SyllableLookup.find('red')).to eq 0
    end
  end
end
