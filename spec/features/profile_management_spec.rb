require 'spec_helper'

feature "profile_managment" do
    let(:joe) { FactoryGirl.create(:user)}
    scenario "" do
        sign_in_with(joe.email, joe.password)
        expect(current_path).to eq '/thanks'

    end
end