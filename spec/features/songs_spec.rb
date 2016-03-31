require 'spec_helper'
require 'rails_helper'

describe "automatic song creation", :js do
  it 'displays a set of lyrics' do
    visit root_path
    click_on "Create song"
    expect(page).to have_content "Play"
    expect(page).to have_content "Download as MIDI"
    within ".lyrics" do
      expect(page).to have_selector '.word'
    end
  end

  it 'allows user to select a lyrical source' do
    allow_any_instance_of(SongsController).to receive(:load_source_from_file)
      .with('Moby Dick').and_return(MarkovChain.new('whale '*16))

    allow_any_instance_of(SongsController).to receive(:load_source_from_file)
      .with('Edgar Allen Poe').and_return(MarkovChain.new('poe '*16))

    visit root_path
    select 'Moby Dick', from: 'Lyrics Source'
    click_on 'Create song'
    within '.lyrics' do
      expect(page).to have_content 'whale'
    end

    visit root_path
    select 'Edgar Allen Poe', from: 'Lyrics Source'
    click_on 'Create song'
    within '.lyrics' do
      expect(page).to have_content 'poe'
    end
  end
end
