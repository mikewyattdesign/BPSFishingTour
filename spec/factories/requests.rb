# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :request do
    requester 1
    invitee 1
    accepted false
  end
end
