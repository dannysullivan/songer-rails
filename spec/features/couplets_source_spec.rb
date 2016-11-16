require 'rails_helper'

describe 'Viewing couplets from a source' do
  it 'displays sentences from the source grouped by syllables and rhyme' do
    visit new_couplets_source_path
    fill_in 'Text', with: 'Handle. Candle. Singing. Bringing. A good word. The bad bird. Fakeword.'

    click_on 'Submit'
    within '.syllable-group-2' do
      within '.rhyme-group-0' do
        expect(page).to have_content 'Handle'
        expect(page).to have_content 'Candle'
      end

      within '.rhyme-group-1' do
        expect(page).to have_content 'Singing'
        expect(page).to have_content 'Bringing'
      end
    end

    within '.syllable-group-3' do
      expect(page).to have_content 'A good word'
      expect(page).to have_content 'The bad bird'
    end

    expect(page).not_to have_content 'Fakeword'
  end
end
