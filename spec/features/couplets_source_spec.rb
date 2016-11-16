require 'rails_helper'

describe 'Viewing couplets from a source' do
  it 'displays sentences from the source grouped by syllables and rhyme' do
    visit new_couplets_source_path
    fill_in 'Text', with: 'Handle. Candle. Singing. Bringing. A handle. The candle. Fakeword.'

    click_on 'Submit'
    expect(page).to have_selector('.rhyme-group', text: 'Handle Candle')
    expect(page).to have_selector('.rhyme-group', text: 'Singing Bringing')
    expect(page).to have_selector('.rhyme-group', text: 'A handle The candle')

    expect(page).not_to have_content 'Fakeword'
  end

  it 'adds new lines to prexisting rhyme groups' do
    group = FactoryGirl.create(:rhyme_group, syllables: 2)
    FactoryGirl.create(:line, rhyme_group: group, text: 'some rhyme')
    FactoryGirl.create(:line, rhyme_group: group, text: 'some time')

    visit new_couplets_source_path
    fill_in 'Text', with: 'a lime. a mime.'

    click_on 'Submit'
    expect(page).to have_selector('.rhyme-group', text: 'some rhyme some time a lime a mime')
  end
end
