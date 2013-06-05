require 'spec_helper'

describe Event do
    it "has a valid factory" do
        puts FactoryGirl.create(:event).as_json
        FactoryGirl.create(:event).should be_valid
    end
end
