require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'Post #create' do
    it 'successfully sign up ' do
      post :create, params: { user: { name: 'name', email: 'name@gmail.com' } }
      expect(User.first.name).to eq('name')
    end
  end
end
