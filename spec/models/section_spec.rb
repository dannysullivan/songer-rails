require 'spec_helper'
require 'rails_helper'

describe '#rhythmic_pattern=' do
  it 'picks notes for the melody' do
    section = Section.new(rhythmic_pattern: 'x.')
    expect(Section::NOTES).to include section.pattern[0].to_i
    expect(section.pattern[1]).to eq '.'
  end
end

describe '.duplicate_without_lyrics' do
  it 'copies the melody and bass from the given section' do
    section1 = create(:section)
    section2 = Section.duplicate_without_lyrics(section1)
    expect(section1).not_to be section2
    expect(section1.pattern).to eq section2.pattern
    expect(section1.bass_notes).to eq section2.bass_notes
    expect(section2.lyrics).to eq ''
  end
end
