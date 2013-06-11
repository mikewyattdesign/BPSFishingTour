# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
   puts User.count
   user1 = User.create({email: "joe@example.com", password: "secret123", password_confirmation: "secret123", confirmed_at: Time.now})

   user2 = User.create({email: "jane@example.com", password: "secret123", password_confirmation: "secret123", confirmed_at: Time.now})

   team1 = Team.create

   team1.users << [user1, user2]

   puts User.count
    profile = Profile.create first_name: "Joe", last_name: "Daggrassi", street_address: "1234 Main Street", city: "St. Louis", zip: "63112", state: "MO", phone: "3211234321", user_id: user1.id

    division1 = Division.create({name: "BM Great Lakes Tour"})

    division2 = Division.create({name: "BM SouthWestern Tour"})

    division3 = Division.create({name: "BM Wildcards"})

    division4 = Division.create({name: "BM 100 Tour"})

    division5 = Division.create({name: "BM Central Tour"})

    division6 = Division.create({name: "BM Eastern Tour"})
    puts Division.all

    event1 = Event.create({name: "Chippawa, Upper Niagra", date: DateTime.new(2013, 9, 29)})

    event2 = Event.create({name: "Chippawa, Upper Niagra", date: DateTime.new(2013, 9, 30)})

    event3 = Event.create({name: "Lake St. Clair", date: DateTime.new(2013, 10, 13)})
    puts Event.all

    event1.divisions<<([division1, division2, division3, division4, division5, division6])
