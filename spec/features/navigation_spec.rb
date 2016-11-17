require 'rails_helper'

describe "Navigation", :js do
  it 'contains a link to the About page' do
    visit root_path
    within '.header' do
      click_on "About"
    end
    expect(page).to have_content "About Songer"
  end

  it 'contains a link to the Add Source page' do
    visit root_path
    within '.header' do
      click_on "Add Source"
    end
    expect(page).to have_content "Add new source"
  end

  it 'contains a link to the Sample Verse page' do
    visit root_path
    within '.header' do
      expect(page).to have_link('Sample Verse', href: couplets_lyrics_path)
    end
  end
end
