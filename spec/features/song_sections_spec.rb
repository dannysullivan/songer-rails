require 'spec_helper'
require 'rails_helper'

describe 'song section interface', :js do
  it 'allows user to generate new sections' do
    song = create(:song)
    visit song_path(song)
    expect(page).not_to have_selector ".section"

    fill_in "Pattern", with: 'x..x..x.x.x.x.x.'
    click_on "Create new section"
    within ".section" do
      lyrics = find(".lyrics").text.split(' ')
      expect(lyrics.length).to eq 7
      expect(page).to have_content 'x..x..x.x.x.x.x.'
    end
  end

  it 'displays lyrics for each section' do
    song = create(:song)
    create(:section, lyrics: 'la la la', song: song)
    visit song_path(song)
    within ".section" do
      expect(page).to have_content 'la la la'
    end
  end
end
