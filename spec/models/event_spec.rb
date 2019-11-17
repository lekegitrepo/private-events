# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  event = nil
  subject { User.new(name: 'test_name', email: 'test_name@gmail.com') }
  before { subject.save }
  before do
    event = subject.events.create(name: 'Birthday Party', date: Date.today,
                                          location: 'Carribean Island',
                                          description: 'To mark Amanda and Thais birthay')
  end

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

  describe 'Associations' do
    it 'event belongs to creator' do
      assc = described_class.reflect_on_association(:creator)
      expect(assc.macro).to eq :belongs_to
    end

    it 'event has many attendees' do
      assc = described_class.reflect_on_association(:attendees)
      expect(assc.macro).to eq :has_many
    end

    it 'event has many attendances' do
      assc = described_class.reflect_on_association(:attendances)
      expect(assc.macro).to eq :has_many
    end
  end
end
