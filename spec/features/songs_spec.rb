require 'spec_helper'
require 'rails_helper'

describe 'new song interface', :js do
  it 'displays an arrangement' do
    visit root_path
    within '.navbar-default' do
      click_on "New Song"
    end
    expect(page).to have_content "New Song"
    expect(page).not_to have_selector ".arrangement"
    fill_in "Rhythm 1", with: "x..x..x."
    fill_in "Rhythm 2", with: ".x..x..x"

    click_on "Create Arrangement"
    within ".arrangement" do
      expect(page).to have_content "x"
      expect(page).to have_content "."
    end
  end
end

describe 'show song interface', :js do
  it 'displays a download link' do
    create(:song, pattern: 'x..x..x.')
    visit root_path
    within '.navbar-default' do
      click_on "Songs"
    end
    click_on "x..x..x."

    expect(page).to have_content "Viewing Song"
    expect(page).to have_content "x..x..x."

    expect(page).to have_link "Download as MIDI"
  end
end
