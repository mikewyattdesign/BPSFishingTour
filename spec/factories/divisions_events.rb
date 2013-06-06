# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :divisions_event, :class => 'DivisionsEvents' do
    event_id 1
    division_id 1
  end
end
