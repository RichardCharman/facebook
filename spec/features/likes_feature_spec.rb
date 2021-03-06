require 'rails_helper'

feature 'liking posts' do
  before do
    Post.create(status: 'Do you like this?')
  end

  scenario 'a user can like a post, which updates the like count' do
    visit '/posts'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end

  it 'a user can like a post, which increments the like count', js: true do
    visit '/posts'
    click_link 'like'
    expect(page).to have_content("1 like")
  end
end