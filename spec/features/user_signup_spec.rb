
require 'rails_helper'

RSpec.describe 'User sign up and login', type: :feature do
  scenario 'sign up for valid new user' do
    visit '/users/new'
    fill_in 'Name', with: 'test_user'
    fill_in 'Email', with: 'test_user@gmail.com'
    click_button 'Create new user'

    expect(page).to have_content('Sign out')
  end

  scenario 'sign up for invalid new user' do
    visit '/users/new'
    fill_in 'Name', with: ' '
    fill_in 'Email', with: 'test_user@gmail.com'
    click_button 'Create new user'

    expect(page).to have_content('Please fill the form below to sign up')
  end

  # scenario 'signs up the user correctly' do
  #   visit new_user_path
  #   fill_in('Name', with: 'Example')
  #   fill_in('Email', with: 'example@email.com')
  #   click_button('Create User')
  #   # visit signin_path
  #   # fill_in('Email', with: 'example@email.com')
  #   # click_button('Submit')
  #   # expect(page).to have_css('.user')
  #   # expect(page).to have_content('Example')
  # end
end
