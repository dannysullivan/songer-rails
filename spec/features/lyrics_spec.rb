require 'rails_helper'

describe 'Lyrics interface', :js do
  it 'viewing generated lyrics' do
    group1 = FactoryBot.create(:rhyme_group, syllables: 8)
    FactoryBot.create(:line, rhyme_group: group1, text: 'line one')
    FactoryBot.create(:line, rhyme_group: group1, text: 'line two')

    group2 = FactoryBot.create(:rhyme_group, syllables: 8)
    FactoryBot.create(:line, rhyme_group: group2, text: 'line one')
    FactoryBot.create(:line, rhyme_group: group2, text: 'line two')

    visit lyrics_path

    expect(page).to have_content "line one line one line two line two"
  end
end
