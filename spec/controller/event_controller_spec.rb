require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  subject { User.new(name: 'test_name') }
  before { subject.save }

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
end
