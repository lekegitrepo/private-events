require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'test_name', email: 'test_name@gmail.com') }
  before { subject.save }

  it 'should be valid' do
    expect(subject).to be_valid
  end

  it 'empty name string should not be valid' do
    subject.name = ' '
    expect(subject).to_not be_valid
  end

  it 'nil name should not be valid' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'short username should not be validd' do
    subject.name = 't'
    expect(subject).to_not be_valid
  end

  it 'longer username should not be validd' do
    subject.name = 't' * 25
    expect(subject).to_not be_valid
  end
end
