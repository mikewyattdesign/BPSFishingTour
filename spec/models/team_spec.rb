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

    it 'should accept 2 users' do
        team1 = FactoryGirl.create(:team)
        user2 = FactoryGirl.create(:user)
        team1.users << user1
        expect(team1.users.count).to eq(1)
        expect(team1.users.first).to eq(user1)
        expect(team1.users.first.my_team).to eq(team1)
        team1.users << user2
        expect(team1.users.last).to eq(user2)
    end

    it 'should let a user leave' do
        team1 = FactoryGirl.create(:team)
        team1.users << user1
        team1.users.delete(user1)
        expect(team1.users).to be_empty
        expect(user1.teams).to be_empty
    end

    it 'should have unique users' do
        team1 = FactoryGirl.create(:team)
        team1.users << user1
        expect(team1.users.count).to eq(1)
        team1.users << user1
        expect(team1.users.count).to eq(1)
    end

    it 'should have at most 2 users' do
        team1 = FactoryGirl.create(:team)
        user0 = FactoryGirl.create(:user)
        user2 = FactoryGirl.create(:user)
        user3 = FactoryGirl.create(:user)
        team1.users << user0
        expect(team1.users.count).to eq(1)
        team1.users << user2
        expect(team1.users.count).to eq(2)
        begin
            team1.users << user3
        rescue Team::FullTeamError => exception
            puts "Team was full"
        ensure
            expect(team1.users.count).to eq(2)
            expect(team1.users.first).to eq(user0)
            expect(team1.users[1]).to eq(user2)
        end
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
