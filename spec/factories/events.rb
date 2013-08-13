# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
    factory :event do
        sequence(:name) do |n|
            locations = %w(Toronto Windsor Edmonton Calgary Banff Jasper Vancouver Saskatoon Penetanguishene Coboconk)
            "#{locations[n % locations.length]}"

        end
        country "Canada"
        postal_code "123456"
        date Time.now

        # :event_with_scores
        # usage: FactoryGirl.create(:event_with_scores, name: "Gateway Classic"), FactoryGirl.create(:event_with_scores, scores: 5)

        factory :event_with_scores do
            ignore do
                scores 5
            end
            after(:create) do |event, evaluator|
                FactoryGirl.create_list(:score_with_team, evaluator.scores, event: event)
            end
        end
    end
end
