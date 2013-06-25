  namespace :load_data do
    desc "loads all of the event data into the database"
    task :events => [:environment, :divisions] do
      # BM Great Lakes Tour = 1
      # BM SouthWestern Tour = 2
      # BM Wildcards = 3
      # BM 100 Tour = 4
      # BM Central Tour  = 5
      # BM Eastern Tour = 6
      # BM NorthWestern Tour = 7
      events = [

        # 100 Tour
        [{
            name: "Sparrow Lake",
            city: "Lauderdale Point Resort, Port Severn",
            province: "ON",
            country: "Canada",
            date: DateTime.new(2013, 6, 22)}, {division: [4]}],

        [{
            name: "Seymore",
            city: "The Monument",
            province: "ON",
            country: "Canada",
            date: DateTime.new(2013, 7, 1)}, {division: [4]}],

        [{
            name: "Port Severn, Gloucester Pool",
            city: "Port Servern Park, Port Severn",
            province: "ON",
            country: "Canada",
            date: DateTime.new(2013, 7, 7)}, {division: [4]}],

        [{
            name: "Port Perry, Lake Scugog",
            city: "Goreski's Landing, Port Perry",
            province: "ON",
            country: "Canada",
            date: DateTime.new(2013, 8, 11)}, {division: [4]}],

        # Central Tour
        [{
            name: "Hastings, Rice Lake",
            city: "Gazebo Waterfront Park, Hastings",
            province: "ON",
            country: "Canada",
            date: DateTime.new(2013, 6, 29)}, {division: [5]}],

        [{
            name: "Bridgenorth, Tri-Lakes",
            city: "Rotary Park, Bridgenorth",
            province: "ON",
            country: "Canada",
            date: DateTime.new(2013, 7, 14)}, {division: [5]}],

        [{
            name: "Lindsay, Sturgeon Lake",
            city: "The Moorings Marina, Snug Harbour",
            province: "ON",
            country: "Canada",
            date: DateTime.new(2013, 8, 10)}, {division: [5]}],

        [{
            name: "Port Perry, Lake Scugog",
            city: "Goreski's Landing, Port Perry",
            province: "ON",
            country: "Canada",
            date: DateTime.new(2013, 8, 11)}, {division: [5]}],


        # Eastern Tour
        [{
            name: "Hastings, Rice Lake",
            city: "Gazebo Waterfront Park, Hastings",
            province: "ON",
            country: "Canada",
            date: DateTime.new(2013, 6, 29)}, {division: [6]}],

        [{
            name: "Hastings, Rice Lake",
            city: "Gazebo Waterfront Park, Hastings",
            province: "ON",
            country: "Canada",
            date: DateTime.new(2013, 6, 30)}, {division: [6]}],

        [{
            name: "Buster Alyea Trenton, Bay of Quinte",
            city: "Buster Alyea Park, Trenton",
            province: "ON",
            country: "Canada",
            date: DateTime.new(2013, 8, 4)}, {division: [6]}],

        [{
            name: "Buster Alyea Trenton, Bay of Quinte",
            city: "Buster Alyea Park, Hastings",
            province: "ON",
            country: "Canada",
            date: DateTime.new(2013, 8, 5)}, {division: [6]}],


        # Great Lake Tour
        [{
            name: "Chippawa, Upper Niagra",
            city: "Greater Niagra",
            province: "ON", country: "Canada",
            date: DateTime.new(2013, 9, 29)}, {division: [1]}],

        [{
            name: "St. Clair",
            city: "Mitchell's Bay Marina Park",
            date: DateTime.new(2013, 10, 13)}, {division: [1]}],

        [{
            name: "Penetanguishene, Georgian Bay",
            city: "Town Docks, Penetanguishene",
            province: "ON",
            country: "Canada",
            date: DateTime.new(2013, 7, 6)}, {division: [1]}],

        [{
            name: "Buster Alyea Trenton, Bay of Quinte",
            city: "Buster Alyea Park, Trenton",
            province: "ON",
            country: "Canada",
            date: DateTime.new(2013, 8, 3)}, {division: [1]}],


        # Northwestern Tour
        [{
            name: "Penetanguishene, Georgian Bay",
            city: "Town Docks, Penetanguishene",
            province: "ON",
            country: "Canada",
            date: DateTime.new(2013, 7, 6)}, {division: [7]}],

        [{
            name: "Port Severn, Gloucester Pool",
            city: "Port Servern Park, Port Severn",
            province: "ON",
            country: "Canada",
            date: DateTime.new(2013, 7, 7)}, {division: [7]}],

        [{
            name: "Muskoka Wharf, Lake Muskoka",
            city: "Muskoka Wharf, Gravenhurst",
            province: "ON",
            country: "Canada",
            date: DateTime.new(2013, 7, 20)}, {division: [7]}],

        [{
            name: "Washago, Couchicing Only ",
            city: "McGregor on the Water, Washago",
            province: "ON",
            country: "Canada",
            date: DateTime.new(2013, 7, 21)}, {division: [7]}],

        # SouthWestern Tour
        # No Events

        # Wildcards Tour
        [{
            name: "“Casey Cup” Orillia, Lake Simcoe",
            city: "Couchiching Park, Orillia",
            province: "ON",
            country: "Canada",
            date: DateTime.new(2013, 6, 23)}, {division: [3]}],

        [{
            name: "Bridgenorth, Tri-Lakes",
            city: "Rotary Park, Bridgenorth",
            province: "ON",
            country: "Canada",
            date: DateTime.new(2013, 7, 13)}, {division: [3]}],

        [{
            name: "Buster Alyea Trenton, Bay of Quinte",
            city: "Buster Alyea Park, Hastings",
            province: "ON",
            country: "Canada",
            date: DateTime.new(2013, 8, 3)}, {division: [3]}],

        [{
            name: "Coboconk, Balsam Lake",
            city: "Government Docks, Coboconk",
            province: "ON",
            country: "Canada",
            date: DateTime.new(2013, 8, 17)}, {division: [3]}],

        [{
            name: "Coboconk, Balsam Lake",
            city: "Government Docks, Coboconk",
            province: "ON",
            country: "Canada",
            date: DateTime.new(2013, 8, 18)}, {division: [3]}]
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
      puts Event.count

    end

    desc "Creates all the Divisions"

    task :divisions => :environment do

      Division.destroy_all

      division1 = Division.create({id: 1, name: "Great Lakes Tour"})

      division2 = Division.create({id: 2, name: "SouthWestern Tour"})

      division3 = Division.create({id: 3, name: "Wildcards"})

      division4 = Division.create({id: 4, name: "100 Tour"})

      division5 = Division.create({id: 5, name: "Central Tour"})

      division6 = Division.create({id: 6, name: "Eastern Tour"})

      division7 = Division.create({id: 7, name: "Northwestern Tour"})
    end
  end