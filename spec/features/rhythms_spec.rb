require 'spec_helper'
require 'rails_helper'

describe 'rhythms interface', :js do
  it 'displays a title' do
    visit "/#/rhythms"
    expect(page).to have_content "Rhythms"
  end

  it 'creates a new rhythm' do
    visit "/#/rhythms"
    expect(page).not_to have_selector '.rhythm'
    click_on "Create new rhythm"
    within '.rhythm' do
      expect(page).to have_content "x"
      expect(page).to have_content "."
    end
  end
end
