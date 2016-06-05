require 'rails_helper'

feature 'Trying new sources' do
  describe 'submitting a new source' do
    it 'displays 5 example couplets pulled from the source' do
      source = 'This is a source of course of course'

      visit new_source_path
      fill_in 'Text', with: source
      click_on 'Submit'

      expect(page).to have_selector('.couplet', count: 5)
      expect(page).to have_content 'source'
      expect(page).to have_content 'course'
    end
  end
end
