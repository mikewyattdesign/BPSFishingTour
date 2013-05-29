
FactoryGirl.define do
  factory :request do
    requester   1
    invitee     1
    accepted    false
    denied      false
  end
end
