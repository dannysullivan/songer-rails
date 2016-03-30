require 'spec_helper'
require 'rails_helper'

describe 'Song' do
  describe '#melody' do
    it 'returns an array of notes' do
      song = create(:song)
      song.sections.build(pattern: '0.0.')

      expect(song.melody).to eq (['0', '.', '0', '.'])
    end
  end

  describe '#bass' do
    it 'returns an array of bass notes' do
      song = build(:song)
      section = build(:section, bass_pattern: '0575')
      song.sections << section

      expect(song.bass).to eq ['0', '5', '7', '5']
    end
  end
end
