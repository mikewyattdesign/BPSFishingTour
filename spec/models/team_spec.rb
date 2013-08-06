require 'spec_helper'

describe Team do
    let (:team) { Team.new(id: 1) }
    let (:user1){FactoryGirl.create(:user)}

    it 'should start with no users' do
        expect(team.users).to be_empty
    end

    it 'should start with no events' do
        expect(team.events).to be_empty
    end

    it 'should start with no scores' do
        expect(team.scores).to be_empty
    end

    it 'should accept a user' do
        team1 = FactoryGirl.create(:team)
        team1.users << user1
        expect(team1.users.count).to eq(1)
        expect(team1.users.first).to eq(user1)
        expect(team1.users.first.my_team).to eq(team1)
    end

    it 'should let a user leave' do
        team1 = FactoryGirl.create(:team)
        team1.users << user1
        team1.users.delete(user1)
        expect(team1.users).to be_empty
        expect(user1.teams).to be_empty
    end

    it 'should have at most 2 users' do

    end

    it 'should respond to :users' do
        expect(team).to respond_to(:users)
    end

    it 'should respond to :events' do
        expect(team).to respond_to(:events)
    end

    it 'should respond to :scores' do
        expect(team).to respond_to(:scores)
    end
end
