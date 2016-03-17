require 'spec_helper'
require 'rails_helper'

describe 'new song interface', :js do
  it 'allows user to specify rhythms' do
    visit new_manual_song_path
    expect(page).to have_content "New Song"
    fill_in "Rhythm1", with: "x..x..x."
    fill_in "Rhythm2", with: "x.x.x.x."

    click_on "Save Song"
    expect(page).to have_content "Song created"
    expect(page).to have_content "x..x..x."
    expect(page).to have_content "x.x.x.x."
  end
end

describe 'show song interface', :js do
  it 'displays a download link' do
    song = create(:song, rhythm1: 'x..x..x.')
    visit manual_song_path(song)

    expect(page).to have_content "Viewing Song"
    expect(page).to have_content "x..x..x."

    expect(page).to have_link "Download as MIDI"
  end
end
