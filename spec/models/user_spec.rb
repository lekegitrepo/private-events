# frozen_string_literal: true

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

  describe 'Associations' do
    it 'user has many events' do
      assc = described_class.reflect_on_association(:events)
      expect(assc.macro).to eq :has_many
    end

    it 'user has many attendances' do
      assc = described_class.reflect_on_association(:attendances)
      expect(assc.macro).to eq :has_many
    end
  end
end
