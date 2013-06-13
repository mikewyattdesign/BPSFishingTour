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
        [{name: "Chippawa, Upper Niagra", address: "4173-4669 Lyons Creek Rd.", city: "Niagra Falls", province: "ON", country: "Canada", date: DateTime.new(2013, 9, 29)}, {division: [1, 2, 3]}],
        [{name: "Chippawa, Upper Niagra", date: DateTime.new(2013, 9, 30)}, {division: [2]}],
        [{name: "Lake St. Clair", date: DateTime.new(2013, 10, 13)}, {division: [2]}],
        [{name: "St. Clair", date: DateTime.new(2013, 10, 13)}, {division: [1]}],
        [{name: "Lake St. Clair", date: DateTime.new(2013, 10, 14)}, {division: [2]}],
        [{name: "Sparrow Lake", date: DateTime.new(2013, 6, 22)}, {division: [4]}],
        [{name: "“Casey Cup” Orillia, Lake Simcoe", date: DateTime.new(2013, 6, 23)}, {division: [3]}],
        [{name: "Hastings, Rice Lake", date: DateTime.new(2013, 6, 29)}, {division: [5, 6]}],
        [{name: "Hastings, Rice Lake", date: DateTime.new(2013, 6, 30)}, {division: [6]}],
        [{name: "Seymore", date: DateTime.new(2013, 7, 1)}, {division: [4]}],
        [{name: "Penetanguishene, Georgian Bay", date: DateTime.new(2013, 7, 6)}, {division: [1, 7]}],
        [{name: "Port Severn, Gloucester Pool", date: DateTime.new(2013, 7, 7)}, {division: [4, 7]}],
        [{name: "Bridgenorth, Tri-Lakes", date: DateTime.new(2013, 7, 13)}, {division: [3]}],
        [{name: "Bridgenorth, Tri-Lakes", date: DateTime.new(2013, 7, 14)}, {division: [5]}],
        [{name: "Muskoka Wharf, Lake Muskoka", date: DateTime.new(2013, 7, 20)}, {division: [7]}],
        [{name: "Washago, Couchicing Only ", date: DateTime.new(2013, 7, 21)}, {division: [7]}],
        [{name: "Buster Alyea Trenton, Bay of Quinte", date: DateTime.new(2013, 8, 3)}, {division: [1, 3]}],
        [{name: "Buster Alyea Trenton, Bay of Quinte", date: DateTime.new(2013, 8, 4)}, {division: [6]}],
        [{name: "Buster Alyea Trenton, Bay of Quinte", date: DateTime.new(2013, 8, 5)}, {division: [6]}],
        [{name: "Lindsay, Sturgeon Lake", date: DateTime.new(2013, 8, 10)}, {division: [5]}],
        [{name: "Port Perry, Lake Scugog", date: DateTime.new(2013, 8, 11)}, {division: [4, 5]}],
        [{name: "Coboconk, Balsam Lake", date: DateTime.new(2013, 8, 17)}, {division: [3]}],
        [{name: "Coboconk, Balsam Lake", date: DateTime.new(2013, 8, 18)}, {division: [3]}]
      ]

      events.each do |event|
        if ev = Event.where("name = ? AND date = ?", event.first[:name], event.first[:date]..event.first[:date]+1.day)
          puts event.first[:name] unless ev.empty?
        end
      end
    end
  end