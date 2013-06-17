  namespace :load_data do
    desc "loads all of the event data into the database"
    task :events => :environment do
      # BM Great Lakes Tour = 1
      # BM SouthWestern Tour = 2
      # BM Wildcards = 3
      # BM 100 Tour = 4
      # BM Central Tour  = 5
      # BM Eastern Tour = 6
      # BM NorthWestern Tour = 7
      events = [
        [{name: "Chippawa, Upper Niagra", city: "Niagra Falls", province: "ON", country: "Canada", date: DateTime.new(2013, 9, 29)}, {division: [1, 2, 3]}],

        [{name: "Chippawa, Upper Niagra", city: "Niagra Falls", province: "ON", country: "Canada",date: DateTime.new(2013, 9, 30)}, {division: [2]}],

        [{name: "Lake St. Clair", date: DateTime.new(2013, 10, 13)}, {division: [2]}],

        [{name: "St. Clair", date: DateTime.new(2013, 10, 13)}, {division: [1]}],

        [{name: "Lake St. Clair", date: DateTime.new(2013, 10, 14)}, {division: [2]}],

        [{name: "Sparrow Lake", city: "Sparrow Lake", province: "ON", country: "Canada", date: DateTime.new(2013, 6, 22)}, {division: [4]}],

        [{name: "“Casey Cup” Orillia, Lake Simcoe", city: "Orillia", province: "ON", country: "Canada", date: DateTime.new(2013, 6, 23)}, {division: [3]}],

        [{name: "Hastings, Rice Lake", city: "Trent Hills", province: "ON", country: "Canada", date: DateTime.new(2013, 6, 29)}, {division: [5, 6]}],

        [{name: "Hastings, Rice Lake", city: "Trent Hills", province: "ON", country: "Canada", date: DateTime.new(2013, 6, 30)}, {division: [6]}],

        [{name: "Seymore", city: "Kenora", province: "ON", country: "Canada", date: DateTime.new(2013, 7, 1)}, {division: [4]}],

        [{name: "Penetanguishene, Georgian Bay", city: "Penetanguishene", province: "ON", country: "Canada", date: DateTime.new(2013, 7, 6)}, {division: [1, 7]}],

        [{name: "Port Severn, Gloucester Pool", city: "Severn", province: "ON", country: "Canada", date: DateTime.new(2013, 7, 7)}, {division: [4, 7]}],

        [{name: "Bridgenorth, Tri-Lakes", city: "Bridgenorth", province: "ON", country: "Canada", date: DateTime.new(2013, 7, 13)}, {division: [3]}],

        [{name: "Bridgenorth, Tri-Lakes", city: "Bridgenorth", province: "ON", country: "Canada", date: DateTime.new(2013, 7, 14)}, {division: [5]}],

        [{name: "Muskoka Wharf, Lake Muskoka", province: "ON", country: "Canada", date: DateTime.new(2013, 7, 20)}, {division: [7]}],

        [{name: "Washago, Couchicing Only ", city: "Washago", province: "ON", country: "Canada", date: DateTime.new(2013, 7, 21)}, {division: [7]}],

        [{name: "Buster Alyea Trenton, Bay of Quinte", city: "Bay of Quinte", province: "ON", country: "Canada", date: DateTime.new(2013, 8, 3)}, {division: [1, 3]}],

        [{name: "Buster Alyea Trenton, Bay of Quinte", city: "Bay of Quinte", province: "ON", country: "Canada", date: DateTime.new(2013, 8, 4)}, {division: [6]}],

        [{name: "Buster Alyea Trenton, Bay of Quinte", city: "Bay of Quinte", province: "ON", country: "Canada", date: DateTime.new(2013, 8, 5)}, {division: [6]}],

        [{name: "Lindsay, Sturgeon Lake", province: "ON", country: "Canada", date: DateTime.new(2013, 8, 10)}, {division: [5]}],

        [{name: "Port Perry, Lake Scugog", province: "ON", country: "Canada", date: DateTime.new(2013, 8, 11)}, {division: [4, 5]}],

        [{name: "Coboconk, Balsam Lake", city: "Kawartha", province: "ON", country: "Canada", date: DateTime.new(2013, 8, 17)}, {division: [3]}],

        [{name: "Coboconk, Balsam Lake", city: "Kawartha", province: "ON", country: "Canada", date: DateTime.new(2013, 8, 18)}, {division: [3]}]
      ]
      Event.destroy_all
      events.each do |event|
        new_event = Event.create(event.first)
        if new_event.persisted?
          puts new_event.divisions.size
          event.last[:division].each { |x| new_event.divisions << Division.find(x) }
          puts new_event.divisions.size
        end
      end
    end
  end