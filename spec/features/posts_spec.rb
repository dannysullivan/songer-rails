require 'spec_helper'
require 'rails_helper'

describe 'posts interface', :js do
  it 'displays a title' do
    visit '/'
    expect(page).to have_content "All Posts"
  end

  it 'displays posts' do
    create(:post, title: "Test Post")
    visit '/'
    expect(page).to have_content "Test Post"
  end

  it 'displays posts' do
    create(:post, title: "Test Post")
    visit '/'
    expect(page).to have_content "Test Post"
  end

  it 'displays posts' do
    create(:post, title: "Test Post")
    user = create(:user)
    visit root_path(as: user)
    expect(page).to have_content "Test Post"
  end

  it 'allows user to create new posts' do
    visit '/'
    click_on "New Post"
    fill_in "Title", with: "Some Title"
    fill_in "Body", with: "Some body copy here"
    click_on "Submit"
    click_on "Posts"
    expect(page).to have_content "Some Title"
    expect(page).to have_content "Some body copy here"
  end

  it 'allows user to upvote' do
    create(:post, title: "Test Post")
    visit '/'
    expect(page).to have_content "0 Votes"
    click_on('Upvote')
    expect(page).to have_content "1 Vote"
  end
end
