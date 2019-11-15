
require 'rails_helper'

RSpec.describe Event, type: :model do
  event = nil
  subject { User.new(name: 'test_name', email: 'test_name@gmail.com') }
  before { subject.save }
  before { event = subject.events_created.create(name: 'Birthday Party', date: Date.today,
                                         location: 'Carribean Island',
                                         description: 'To mark Amanda and Thais birthay')
  }

  it 'should be valid' do
    expect(event).to be_valid
  end

  it 'should be invalid for nil event name' do
    event.name = nil
    expect(event).to_not be_valid
  end

  it 'should be invalid for nil event location' do
    event.location = nil
    expect(event).to_not be_valid
  end

  it 'should be invalid for nil event description' do
    event.description = nil
    expect(event).to_not be_valid
  end

  it 'should be invalid for nill creator' do
    event.creator = nil
    expect(event).to_not be_valid
  end
end
