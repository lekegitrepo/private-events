# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User sign up and login to create new event', type: :feature do
  scenario 'create new event for invalid new user' do
    visit new_event_path
    expect(page).to have_content('Please login or sign up to create an event')
    expect(page).to have_content('login')
    expect(page).to have_current_path(new_event_path)
  end
end
