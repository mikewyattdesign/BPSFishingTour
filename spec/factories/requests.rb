
FactoryGirl.define do
  factory :request do
    requester   1
    invitee_email     'example@example.com'
    accepted    false
    denied      false
  end
end
