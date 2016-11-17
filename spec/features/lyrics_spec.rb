require 'rails_helper'

describe 'Lyrics interface' do
  it 'viewing generated lyrics' do
    group1 = FactoryGirl.create(:rhyme_group, syllables: 8)
    FactoryGirl.create(:line, rhyme_group: group1, text: 'line one')
    FactoryGirl.create(:line, rhyme_group: group1, text: 'line two')

    group2 = FactoryGirl.create(:rhyme_group, syllables: 8)
    FactoryGirl.create(:line, rhyme_group: group2, text: 'line one')
    FactoryGirl.create(:line, rhyme_group: group2, text: 'line two')

    visit couplets_lyrics_path

    expect(page).to have_content 'line one line one line two line two'
  end
end
