# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Member, type: :model do
  subject { FactoryBot.create(:member) }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without a first_name' do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without a last_name' do
    subject.last_name = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without a phone number' do
    subject.phone = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without a birthday' do
    subject.birthday = nil
    expect(subject).to_not be_valid
  end
  it 'returns the correct full_name' do
    expect(subject.full_name).to eq(subject.full_name)
  end
end
