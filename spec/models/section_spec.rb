require 'spec_helper'
require 'rails_helper'

describe '#rhythmic_pattern=' do
  it 'picks notes for the melody' do
    section = Section.new(rhythmic_pattern: 'x.')
    expect(Section::NOTES).to include section.pattern[0].to_i
    expect(section.pattern[1]).to eq '.'
  end
end

describe '#set_default_bass' do
  it 'picks the right number of bass notes' do
    section = create(:section, pattern: 'x..x..x.x..x..x.')
    expect(section.bass_notes.length).to eq 2
  end
end
