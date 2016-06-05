require 'spec_helper'
require 'rails_helper'

describe "Navigation", :js do
  it 'contains a link to the About page' do
    visit root_path
    within '.header' do
      click_on "About"
    end
    expect(page).to have_content "About Songer"
  end

  it 'contains a link to the Test Source page' do
    visit root_path
    within '.header' do
      click_on "Test Source"
    end
    expect(page).to have_content "Try new source"
  end
end
