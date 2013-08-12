# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :score do
    # t.integer   "event_id"
    # t.integer   "position"
    # t.string    "angler"
    # t.string    "angler_rewards"
    # t.string    "co_angler"
    # t.string    "co_angler_rewards"
    # t.decimal   "weight"
    # t.decimal   "bf"
    # t.decimal   "hp"
    # t.integer   "angler_id"
    # t.integer   "co_angler_id"
    # t.integer   "team_id"

    event { FactoryGirl.create(:event) }
    sequence(:position, 1)
    # angler_user { FactoryGirl.create(:user_with_profile) }
    # co_angler_user { FactoryGirl.create(:user_with_profile) }
    angler_rewards "MyString"
    co_angler_rewards "MyString"
    weight "9.99"
    bf "9.99"
    hp "9.99"

    factory :score_with_team do
        before(:create) do |score|
            FactoryGirl.create(:team_with_users)
        end
        after(:create) do |score|
            score.update(angler_id: Team.last.users.first.id)
            score.update(co_angler_id: Team.last.users.first.teammate.id)
            score.update(angler: score.angler_user.full_name)
            score.update(co_angler: score.co_angler_user.full_name)

        end
    end
  end
end
