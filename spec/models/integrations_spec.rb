require 'rails_helper'
require 'capybara/rails'
RSpec.describe 'Integrations', type: :system do
  describe 'Navigation' do
    it 'Shows main page after Log In' do
      user = User.create!(username: 'testuser')
      visit root_path
      fill_in 'username', with: user.username
      click_on 'Log In'
      sleep(1)
      expect(page).to have_content(user.username)
    end

    it 'Shows Log In page if you try to access main page without Log In' do
      visit root_path
      sleep(1)
      expect(page).to have_content('Sign Up!')
    end

    it 'New Transaction action' do
      user = User.create!(username: 'testuser')
      visit root_path
      fill_in 'username', with: user.username
      click_on 'Log In'
      click_on 'All my transactions'
      click_on 'New Transaction'
      fill_in 'name', with: 'Integration Test Transaction'
      fill_in 'amount', with: '20.00'
      click_on 'Save'
      sleep(1)
      expect(page).to have_content('Integration Test Transaction')
    end

    it 'New group action' do
      user = User.create!(username: 'testuser')
      visit root_path
      fill_in 'username', with: user.username
      click_on 'Log In'
      click_on 'All groups'
      click_on 'New Group'
      fill_in 'name', with: 'New Group'
      click_on 'Save'
      sleep(1)
      expect(page).to have_content('New Group')
    end

    it 'New Assignment' do
      user = User.create!(username: 'testuser')
      visit root_path
      fill_in 'username', with: user.username
      click_on 'Log In'
      click_on 'All my transactions'
      click_on 'New Transaction'
      fill_in 'name', with: 'Integration Test Transaction'
      fill_in 'amount', with: '20.00'
      click_on 'Save'
      visit root_path
      click_on 'All groups'
      click_on 'New Group'
      fill_in 'name', with: 'New Group'
      click_on 'Save'
      visit root_path
      click_on 'All my external transactions'
      click_on 'Assign'
      click_on 'New Group'
      visit root_path
      click_on 'All groups'
      sleep(1)
      expect(page).to have_content('Transactions: 1')
    end
  end
end
