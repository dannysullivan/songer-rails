require 'spec_helper'
require 'rails_helper'

describe 'new song interface', :js do
  it 'allows user to specify a pattern and lyrics' do
    visit root_path
    within '.navbar-default' do
      click_on "New Song"
    end
    expect(page).to have_content "New Song"
    fill_in "Pattern", with: "x..x..x."
    fill_in "Lyrics", with: "La la la la la"

    click_on "Save Song"
    expect(page).to have_content "Song created"
    expect(page).to have_content "x..x..x."
    expect(page).to have_content "La la la la la"
  end

  it 'creates a pattern' do
    visit root_path
    within '.navbar-default' do
      click_on "New Song"
    end
    expect(page).to have_content "New Song"

    fill_in "Rhythm 1", with: "x..x..x."
    fill_in "Rhythm 2", with: ".x.x.x.x"
    click_on "Create Pattern"

    click_on "Save Song"
    expect(page).to have_content "Song created"
    expect(page).to have_content "x..x..x."
    expect(page).to have_content ".x.x.x.x"
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
