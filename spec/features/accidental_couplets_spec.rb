require 'rails_helper'

describe 'Accidental couplets' do
  it 'show rhyming sentences with the same number of syllables in source' do
    visit new_accidental_couplets_source_path
    fill_in 'Text', with: ''
    click_on 'Accidental couplets'

    expect(page).to have_content ''
  end
end
