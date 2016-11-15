require 'rails_helper'

describe 'Viewing couplets from a source' do
  it 'displays sentences from the source grouped by syllables and rhyme' do
    visit new_couplets_source_path
    fill_in 'Text', with: 'Word. Bird. A word. The bird. Fakeword.'

    click_on 'Submit'
    within '.syllable-group-1' do
      expect(page).to have_content '1 syllable'
      expect(page).to have_content 'Word'
      expect(page).to have_content 'Bird'
    end

    within '.syllable-group-2' do
      expect(page).to have_content '2 syllables'
      expect(page).to have_content 'A word'
      expect(page).to have_content 'The bird'
    end

    expect(page).not_to have_content 'Fakeword'
  end
end
