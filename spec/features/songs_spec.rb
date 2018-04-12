require 'spec_helper'
require 'rails_helper'

describe "automatic song creation", :js do
  it 'displays a set of lyrics' do
    visit new_song_path
    click_on "Create song"
    expect(page).to have_content "Play"
    expect(page).to have_content "Download as MIDI"
    within ".lyrics" do
      expect(page).to have_selector '.word'
    end
  end

  it 'allows user to select a lyrical source' do
    visit new_song_path
    select 'Moby Dick', from: 'Lyrics Source'
    click_on 'Create song'
    within ".lyrics" do
      expect(page).to have_selector '.word'
    end

    visit new_song_path
    select 'Edgar Allen Poe', from: 'Lyrics Source'
    click_on 'Create song'
    within ".lyrics" do
      expect(page).to have_selector '.word'
    end
  end

  it 'displays a link to the About page' do
    visit new_song_path
    click_on 'About Songer'
    expect(page).to have_content 'Songer is an automatic songwriting tool.'
  end
end
