require 'spec_helper'
require 'rails_helper'

describe '#rhythmic_pattern=' do
  it 'picks notes for the melody' do
    create(:word)
    section = Section.new(rhythmic_pattern: 'x.')
    expect(Section::NOTES).to include section.pattern[0].to_i
    expect(section.pattern[1]).to eq '.'
  end
end

describe '#set_default_bass' do
  it 'picks the right number of bass notes' do
    create(:word)
    section = create(:section, rhythmic_pattern: 'x..x..x.x..x..x.')
    expect(section.bass_notes.length).to eq 2
  end
end

describe '#set_default_lyrics' do
  it 'sets lyrics to an array of words' do
    create(:word, value: 'test')
    section = create(:section, rhythmic_pattern: 'xx')
    expect(section.lyrics_words.map(&:value)).to eq ['test', 'test']
  end
end

describe '.duplicate_without_lyrics' do
  it 'copies the melody and bass from the given section' do
    create(:word, value: 'one')
    create(:word, value: 'two')
    section1 = create(:section)
    section2 = Section.duplicate_without_lyrics(section1)
    expect(section1).not_to be section2
    expect(section1.pattern).to eq section2.pattern
    expect(section1.bass_notes).to eq section2.bass_notes
    expect(section1.lyrics).not_to eq section2.lyrics
    expect(section2.lyrics).to be
  end
end
