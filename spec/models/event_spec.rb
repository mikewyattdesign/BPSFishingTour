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

    it 'should be able to merge into another event' do
        division1 = Division.create(name: "Div 1")
        division2 = Division.create(name: "Div 2")
        new_event = FactoryGirl.create(:event_with_scores)
        another_event = FactoryGirl.create(:event_with_scores)
        third_event = FactoryGirl.create(:event)
        division1.events << new_event
        division2.events << another_event
        division2.events << third_event

        new_event_teams = new_event.teams
        another_event_teams = another_event.teams

        new_event_scores = new_event.scores

        another_event_teams.each{|team| third_event.teams << team}

        # merging two events that both have scores should fail and return false
        expect(new_event.merge(another_event)).to be_false
        puts "merge fail" if new_event.merge(third_event) == false
        expect(division2.events.include?(new_event)).to be_true
        expect(new_event.teams == (new_event_teams + another_event_teams).uniq).to be_true
        expect(Event.where(id: third_event.id).empty?).to be_true
    end

end
