# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    user = User.create email: "joe@example.com", password: "secret1", confirmed_at: Time.now

    profile = Profile.create first_name: "Joe", last_name: "Daggrassi", street_address: "1234 Main Street", city: "St. Louis", zip: "63112", state: "MO", phone: "3211234321", user_id: user.id