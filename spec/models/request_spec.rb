require 'spec_helper'

describe Request do
    subject (FactoryGirl.create(:request))
    it { should respond_to(:acceptance_url) }
end
