require 'spec_helper'

describe User do
  subject(:dan) { User.new(
      email: "dan@example.com",
      password: "secretpassword"
      )}

    it { should be_valid }
    it "should be valid" do
      dan.should be_valid
    end

    it "should not valid without email" do
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
end
