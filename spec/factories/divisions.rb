# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
    factory :division do
        name "MyString"

        factory :division_with_events do
            ignore do
                events 5
            end
            after(:create) do |division, evaluator|
                FactoryGirl.create_list(:event, evaluator.events).each do |event|
                    division.events << event
                end
            end
        end

        factory :division_with_full_events do
            ignore do
                teams 5
                events 5
                make_teams true
            end

            before(:create) do |division, evaluator|
                FactoryGirl.create_list(:team_with_users, evaluator.teams) if evaluator.make_teams
            end

            after(:create) do |division, evaluator|
                evaluator.events.times do |event_index|
                    event = FactoryGirl.create(:event)
                    Team.all.each do |team|
                        FactoryGirl.create(:score_with_specific_team, event: event, team: team, position: team.id)
                    end
                    division.events << event
                end
            end
        end

    end
end
