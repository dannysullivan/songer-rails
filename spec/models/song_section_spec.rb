require 'spec_helper'
require 'rails_helper'

describe '#rhythmic_pattern=' do
  it 'picks notes for the melody' do
    section = Section.new(rhythmic_pattern: 'x.')
    expect(Section::NOTES).to include section.pattern[0].to_i
    expect(section.pattern[1]).to eq '.'
  end
end
