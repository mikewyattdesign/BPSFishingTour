require 'spec_helper'

describe User do
  subject(:dan) { User.new(
      email: "dan@example.com",
      password: "secretpassword"
      )}

    subject(:dave) { User.new(
      email: "dave@example.com",
      password: "secretpassword"
      )}

    it { should be_valid }
    it "should be valid" do
        dan.should be_valid
    end

    it "should have profile after creation" do
        dan.save
        dan.profile.should_not be(nil)
        Profile.count.should > 0
    end

    it "should take its profile with it when deleted" do
        dan.save
        profile = dan.profile
        expect{ dan.destroy }.to change{ Profile.count }.from(1).to(0)
    end

    it "should not be valid without email" do
        dan.email = nil
        dan.should_not be_nil
    end

    it "should not be vaild without password" do
        dan.password = nil
        dan.should_not be_nil
    end

    it 'should respond to :profile' do
        expect(dan).to respond_to(:profile)
    end

    it 'should respond to :teams' do
        expect(dan).to respond_to(:teams)
    end

    it 'should respond to :events' do
        expect(dan).to respond_to(:events)
    end

    it 'should respond to :scores' do
        expect(dan).to respond_to(:scores)
    end

    it 'should start without a team' do
        expect(dan.teams).to be_empty
    end

    it 'should start without a teammate' do
        expect(dan.teammate).to be_false
    end

    it 'should be able to start a team'  do
        new_team = Team.create
        new_team.users << dan
        expect(dan.teams.count).to eq(1)
        expect(dan.my_team).to eq(new_team)
    end

    it 'should be able to leave a team' do
        expect(dan.teams).to be_empty
        new_team = Team.create
        new_team.users << dan
        expect(dan.teams.count).to eq(1)
        expect(dan.my_team).to eq(new_team)
        dan.teams.delete(new_team)
        expect(dan.teams).to be_empty
    end

    it 'should be able to join a team' do
        expect(dan.teams).to be_empty
        expect(dave.teams).to be_empty
        new_team = Team.create
        new_team.users << dan
        expect(dan.teams.count).to eq(1)
        expect(dan.my_team).to eq(new_team)
        new_team.users << dave
        expect(dave.teams.count).to eq(1)
        expect(dave.my_team).to eq(new_team)
        expect(new_team.users.count).to eq(2)
    end

    it 'should accept a teammate' do
        new_team = Team.create
        new_team.users << dan
        new_team.users << dave
        expect(dave.teammate).to eq(dan)
        expect(dan.teammate).to eq(dave)
    end

    it 'should only care about its first team' do
        new_team = Team.create
        new_team.users << dan
        new_team.users << dave
        other_team = Team.create
        other_team.users << dave
        other_team.users << dan
        expect(dan.my_team).to eq(new_team)
        expect(dave.my_team).to eq(new_team)
    end


end
