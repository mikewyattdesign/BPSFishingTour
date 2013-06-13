  namespace :load_data do
    desc "loads all of the event data into the database"
    task :events do
      # BM Great Lakes Tour = 1
      # BM SouthWestern Tour = 2
      # BM Wildcards = 3
      # BM 100 Tour = 4
      # BM Central Tour  = 5
      # BM Eastern Tour = 6
      events = [
        [{name: "Chippawa, Upper Niagra", date: DateTime.new(2013, 9, 29)}, {division: [1, 2, 3]}],
        {name: "Chippawa, Upper Niagra", date: DateTime.new(2013, 9, 30)},
        {name: "Lake St. Clair", date: DateTime.new(2013, 10, 13)},
        {name: "St. Clair", date: DateTime.new(2013, 10, 13)},
        {name: "Lake St. Clair", date: DateTime.new(2013, 10, 14)},
        {name: "Sparrow Lake", date: DateTime.new(2013, 6, 22)},
        {name: "“Casey Cup” Orillia, Lake Simcoe", date: DateTime.new(2013, 6, 23)},
        {name: "Hastings, Rice Lake", date: DateTime.new(2013, 6, 29)},
        {name: "Hastings, Rice Lake", date: DateTime.new(2013, 6, 30)},
        {name: "Seymore", date: DateTime.new(2013, 7, 1)},
        {name: "Penetanguishene, Georgian Bay", date: DateTime.new(2013, 7, 6)},
        {name: "Port Severn, Gloucester Pool", date: DateTime.new(2013, 7, 7)},
        {name: "Bridgenorth, Tri-Lakes", date: DateTime.new(2013, 7, 13)},
        {name: "Bridgenorth, Tri-Lakes", date: DateTime.new(2013, 7, 14)},
        {name: "Muskoka Wharf, Lake Muskoka", date: DateTime.new(2013, 7, 20)},
        {name: "Washago, Couchicing Only ", date: DateTime.new(2013, 7, 21)},
        {name: "Buster Alyea Trenton, Bay of Quinte", date: DateTime.new(2013, 8, 3)},
        {name: "Buster Alyea Trenton, Bay of Quinte", date: DateTime.new(2013, 8, 4)},
        {name: "Buster Alyea Trenton, Bay of Quinte", date: DateTime.new(2013, 8, 5)},
        {name: "Lindsay, Sturgeon Lake", date: DateTime.new(2013, 8, 10)},
        {name: "Port Perry, Lake Scugog", date: DateTime.new(2013, 8, 11)},
        {name: "Coboconk, Balsam Lake", date: DateTime.new(2013, 8, 17)},
        {name: "Coboconk, Balsam Lake", date: DateTime.new(2013, 8, 18)},
      ]
      puts events.first.last[:division]
    end
  end