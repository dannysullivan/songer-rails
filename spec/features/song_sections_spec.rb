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
      expect(page).to have_content 'x..x..x.x.x.x.x.'
    end
  end
end
