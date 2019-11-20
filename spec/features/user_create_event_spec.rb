# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User sign up and login to create new event', type: :feature do
  scenario 'create new event for invalid new user' do
    visit new_event_path
    expect(page).to have_content('Please login or sign up to create an event')
    expect(page).to have_content('login')
    expect(page).to have_current_path(new_event_path)
  end

  scenario 'Creating new event' do
    @user = User.create(name: 'test', email: 'test@example.com')

    visit new_user_path
    fill_in 'Name', with: @user.name
    fill_in 'Email', with: @user.email
    click_button 'Create new user'

    visit '1'

    click_link 'Create New Event'

    expect(page).to have_content 'Create New Event'

    visit new_event_path
    fill_in('Name', with: 'Birthday')
    fill_in('Location', with: 'Yacht')
    fill_in('Description', with: 'Birthday party')
    click_button('Create Event')
  end

  scenario 'Update event' do
    @user = User.create(name: 'test', email: 'test@example.com')

    visit new_user_path
    fill_in 'Name', with: @user.name
    fill_in 'Email', with: @user.email
    click_button 'Create new user'

    visit '1'

    click_link 'Create New Event'

    expect(page).to have_content 'Create New Event'

    visit new_event_path
    fill_in('Name', with: 'Birthday')
    fill_in('Location', with: 'Yacht')
    fill_in('Description', with: 'Birthday party')
    click_button('Create Event')

    visit events_path
    click_link 'Edit'
    visit 'edit'
    expect(page).to have_text('Editing Event')
    expect(page).to have_button('Update Event')
    fill_in('Location', with: 'Carribean Island')
    click_button('Update Event')
  end
end
