require 'spec_helper'

describe User do
  subject(:dan) { User.new(
      email: "dan@example.com",
      password: "secretpassword"
      )}

    it { should be_valid }
    it "should be valid" do
        subject.should be_valid
    end

    it "should not valid without email" do
      subject.email = nil
      subject.should_not be_nil
    end

    it "should not be vaild without password" do
        subject.password = nil
        subject.should_not be_nil
    end
end
