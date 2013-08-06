require 'spec_helper'

describe Score do
    subject(:first_place) { Score.new(
      event_id: 1,
      position: 1
      )}
  it 'should be invalid without a position' do
    new_score = Score.new
    expect(new_score.invalid?).to be_true
    expect(new_score.errors[:position].any?).to be_true
  end

  it 'should be invalid without an event' do
    new_score = Score.new
    expect(new_score.invalid?).to be_true
    expect(new_score.errors[:event_id].any?).to be_true
  end

  it 'should respond to :event' do
    expect(first_place).to respond_to(:event)
  end

  it 'should respond to :team' do
    expect(first_place).to respond_to(:team)
  end

  it 'should respond to :user' do
    expect(first_place).to respond_to(:user)
  end

  it 'should respond to :angler_user' do
    expect(first_place).to respond_to(:angler_user)
  end

  it 'should respond to :co_angler_user' do
    expect(first_place).to respond_to(:co_angler_user)
  end

end
