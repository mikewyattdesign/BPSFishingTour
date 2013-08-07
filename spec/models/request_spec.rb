require 'spec_helper'

describe Request do
    subject {FactoryGirl.create(:request)}

    it { should respond_to(:invitation_url) }

    its(:invitation_url) { should eq("/teammate/invite_response/#{subject.id}")}

    its(:accepted) {should be_false}

    its(:denied) {should be_false}

    it 'should be invalid without a requester' do
        new_request = Request.create
        expect(new_request.invalid?).to be_true
        expect(new_request.errors[:requester].any?).to be_true
    end

    it 'should be invalid without an invitee email' do
        new_request = Request.create
        expect(new_request.invalid?).to be_true
        expect(new_request.errors[:invitee_email].any?).to be_true
    end
end
