# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  subject { User.new(name: 'test_name') }
  before { subject.save }

  describe 'GET' do
    it 'returns success status for new' do
      get :new
      expect(response).to be_successful
    end

    it 'returns success status index' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'Post #create' do
    it 'Create an event' do
      session[:user_id] = subject.id
      post :create, params: { event: { name: 'Birthday Party', date: Date.today,
                                       location: 'Carribean Island',
                                       description: 'To mark Amanda and Thais birthay' } }
      expect(Event.first.name).to eq('Birthday Party')
      expect(Event.first.location).to eq('Carribean Island')
      expect(Event.first.description).to eq('To mark Amanda and Thais birthay')
    end
  end

  describe 'Put #update' do
    event_info = nil
    before :each do
      session[:user_id] = subject.id
      event_info = post :create, params: { event: { name: 'Birthday Party', date: Date.today,
                                       location: 'Carribean Island',
                                       description: 'To mark Amanda and Thais birthay' } }
    end

    it 'Initial event data' do
      expect(Event.first.name).to eq('Birthday Party')
      expect(Event.first.location).to eq('Carribean Island')
      expect(Event.first.description).to eq('To mark Amanda and Thais birthay')
    end

    # it 'Update an event data' do
    #   session[:user_id] = subject.id
    #   patch event_url(event_info), params: { event: { name: 'Naming Party', date: Date.today,
    #                                    location: 'Great Wall of China',
    #                                    description: 'Naming Ceremony' } }
    #   event_url.reload

    #   expect(Event.first.name).to eq('Naming Party')
    #   expect(Event.first.location).to eq('Great Wall of China')
    #   expect(Event.first.description).to eq('Naming Ceremony')
    # end

    # scenario 'Update an event data' do
    #   @user = User.create(name: 'test', email: 'test@example.com')

    #   visit new_event_path
    #   fill_in 'Name', with: @user.name
    #   fill_in 'Email', with: @user.email
    #   click_button 'Create new user'

    #   visit '1'

    #   click_link 'Create New Event'

    #   expect(page).to have_content 'Create New Event'

    #   visit new_event_path
    #   fill_in('Name', with: 'Birthday')
    #   fill_in('Location', with: 'Yacht')
    #   fill_in('Description', with: 'Birthday party')
    #   click_button('Create Event')
    # end
  end
end
