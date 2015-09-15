require 'rails_helper'

feature 'commenting' do
  before {Post.create status: 'On my way to work'}

  scenario 'allows users to leave a comment using a form' do
    visit '/posts'
    click_link 'Comment'
    fill_in "Comment", with: "Have a great day"
    click_button 'Comment'
    expect(page).to have_content('Have a great day')
  end
end