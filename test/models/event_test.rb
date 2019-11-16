# frozen_string_literal: true

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'test_name', email: 'test@gmail.com')
    @user.save

    @event = @user.events_created.create(name: 'Birthday Party', date: Date.today,
                                         location: 'Carribean Island',
                                         description: 'To mark Amanda and Thais birthay')
  end

  test 'should be valid' do
    assert @event.valid?
  end

  test 'should be invalid for nil event name' do
    @event.name = nil
    assert_not @event.valid?
  end

  test 'should be invalid for nil event location' do
    @event.location = nil
    assert_not @event.valid?
  end

  test 'should be invalid for nil event description' do
    @event.description = nil
    assert_not @event.valid?
  end

  test 'should be invalid for nill creator' do
    @event.creator = nil
    assert_not @event.valid?
  end
end
