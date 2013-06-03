require 'spec_helper'

describe Request do
    subject {FactoryGirl.create(:request)}

    it { should respond_to(:invitation_url) }

    its(:invitation_url) { should eq("/teammate/invite_response/#{subject.id}")}
end
