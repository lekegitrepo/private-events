
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

  subject { User.new(name: 'test_user', email: 'test_user@gmail.com') }
  before { subject.save }

  scenario 'login for valid new user' do
    visit '/login'
    # fill_in 'Name', with: 'test_user'
    fill_in 'Email', with: 'test_user@gmail.com'
    click_button 'Sign In'

    expect(page).to have_content('Signed in')
  end

  scenario 'login for invalid new user' do
    visit '/login'
    # fill_in 'Name', with: 'test_user'
    fill_in 'Email', with: 'test@gmail.com'
    click_button 'Sign In'

    expect(page).to have_content('Login')
  end
end
