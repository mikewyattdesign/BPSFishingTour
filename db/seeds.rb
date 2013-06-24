# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


   user1 = User.create({email: "joe@example.com", password: "secret123", password_confirmation: "secret123", confirmed_at: Time.now})

   user2 = User.create({email: "jane@example.com", password: "secret123", password_confirmation: "secret123", confirmed_at: Time.now})

   user3 = User.create({email: "tom@example.com", password: "secret123", password_confirmation: "secret123", confirmed_at: Time.now})

   team1 = Team.create

   team1.users << [user1, user2]

   puts User.count
