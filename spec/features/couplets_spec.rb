require 'spec_helper'

describe 'Viewing couplets from a source' do
  it 'displays all sentences from the source grouped by syllables and rhyme' do
    visit new_couplets_source_path
    fill_in 'Source text', with: 'Word. Bird. A word. The bird. Something.'
    click_on 'Submit'
    expect(page).to have_content 
  end
end
