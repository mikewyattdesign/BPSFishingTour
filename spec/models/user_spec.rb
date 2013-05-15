require 'spec_helper'

describe User do
  let(:dan) {{
    email: "dan@example.com",
    password: "secretpassword"
    }}

    before(:each) do
      @dan = User.new dan
    end
    it "should be valid" do
        @dan.should be_valid
    end

    it "should not valid without email" do
      @dan.email = nil
      @dan.should_not be_nil
    end

    it "should not be vaild without password" do
        @dan.password = nil
        @dan.should_not be_nil
    end
end
