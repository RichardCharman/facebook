require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should not display any posts' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(status: 'This is my status update')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('This is my status update')
    end
  end

  context 'adding a post' do
    scenario 'user can fill out a form, then post status update' do
      visit '/posts'
      fill_in 'Status', with: 'Going to work'
      click_button 'Create Post'
      expect(page).to have_content 'Going to work'
      expect(current_path).to eq '/posts'
    end
  end

  context 'deleting posts' do

    before {Post.create status: 'Going to work'}

    scenario 'removes a post when a user clicks delete' do
      visit '/posts'
      click_link 'Delete'
      expect(page).not_to have_content 'Going to work'
      expect(page).to have_content 'Status deleted'
    end
  end
end