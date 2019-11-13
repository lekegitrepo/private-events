require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: 'test_name', email: 'test@gmail.com')
  end

  test 'should be valid' do
    assert @user.valid?
  end
end
