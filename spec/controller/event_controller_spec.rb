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
  end
end
