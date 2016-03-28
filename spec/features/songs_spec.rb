require 'spec_helper'
require 'rails_helper'

describe "automatic song creation", :js do
  it 'displays a set of lyrics' do
    create(:word, value: 'la')
    visit root_path
    click_on "Create song"
    expect(page).to have_content "Play"
    expect(page).to have_content "Download as MIDI"
    within ".lyrics" do
      expect(page).to have_content 'la la la la la la la la'
    end
  end
end
