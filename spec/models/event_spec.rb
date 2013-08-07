require 'spec_helper'

describe Event do
    it "has a valid factory" do
        FactoryGirl.create(:event).should be_valid
    end

    it 'should be invalid without a name' do
        new_event = Event.create
        expect(new_event.invalid?).to be_true
        expect(new_event.errors[:name].any?).to be_true
    end

    it 'should be invalid without a date' do
        new_event = Event.create
        expect(new_event.invalid?).to be_true
        expect(new_event.errors[:date].any?).to be_true
    end

    it 'should respond to :scores' do
        new_event = FactoryGirl.create(:event)
        expect(new_event).to respond_to(:scores)
    end

    it 'should respond to :teams' do
        new_event = FactoryGirl.create(:event)
        expect(new_event).to respond_to(:teams)
    end


end
