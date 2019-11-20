# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'test_name', email: 'test@gmail.com')
    @user.save
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'should not be valid' do
    @user.name = ''
    assert_not @user.valid?
  end

  test 'nil should not be valid' do
    @user.name = nil
    assert_not @user.valid?
  end

  test 'short name should not be valid' do
    @user.name = 'T'
    assert_not @user.valid?
  end

  test 'long name should not be valid' do
    @user.name = 'T' * 25
    assert_not @user.valid?
  end
end
