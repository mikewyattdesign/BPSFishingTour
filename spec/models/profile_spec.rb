require 'spec_helper'

describe Profile do

  it 'should be invalid without a first name' do
    new_profile = Profile.create
    expect(new_profile.invalid?).to be_true
    expect(new_profile.errors[:first_name].any?).to be_true
  end

  it 'should be invalid without a last name' do
    new_profile = Profile.create
    expect(new_profile.invalid?).to be_true
    expect(new_profile.errors[:last_name].any?).to be_true
  end

  it 'should have no leading spaces in the first name' do
    new_profile = Profile.create(first_name: " Mike")
    expect(new_profile.invalid?).to be_true
    expect(new_profile.errors[:first_name].any?).to be_true
  end

  it 'should have no leading spaces in the last name' do
    new_profile = Profile.create(last_name: " Skinny")
    expect(new_profile.invalid?).to be_true
    expect(new_profile.errors[:last_name].any?).to be_true
  end

  it 'should have no trailing spaces in the first name' do
    new_profile = Profile.create(first_name: "Mike ")
    expect(new_profile.invalid?).to be_true
    expect(new_profile.errors[:first_name].any?).to be_true
  end

  it 'should have no trailing spaces in the last name' do
    new_profile = Profile.create(last_name: "Skinny ")
    expect(new_profile.invalid?).to be_true
    expect(new_profile.errors[:last_name].any?).to be_true
  end

  it 'should be invalid without a street address' do
    new_profile = Profile.create
    expect(new_profile.invalid?).to be_true
    expect(new_profile.errors[:street_address].any?).to be_true
  end

  it 'should be invalid without a city' do
    new_profile = Profile.create
    expect(new_profile.invalid?).to be_true
    expect(new_profile.errors[:city].any?).to be_true
  end

  it 'should be invalid without a state' do
    new_profile = Profile.create
    expect(new_profile.invalid?).to be_true
    expect(new_profile.errors[:state].any?).to be_true
  end

  it 'should respond to :user' do
    new_profile = FactoryGirl.create(:profile)
    expect(new_profile).to respond_to(:user)
  end

end
