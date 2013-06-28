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
                id: 52,
                name: "Sparrow Lake",
                city: "Lauderdale Point Resort, Port Severn",
                province: "ON",
                country: "Canada",
                date: DateTime.new(2013, 6, 22)}, {division: [4]}],

            [{
                id: 53,
                name: "Seymore",
                city: "The Monument",
                province: "ON",
                country: "Canada",
                date: DateTime.new(2013, 7, 1)}, {division: [4]}],

            [{
                id: 54,
                name: "Port Severn, Gloucester Pool",
                city: "Port Servern Park, Port Severn",
                province: "ON",
                country: "Canada",
                date: DateTime.new(2013, 7, 7)}, {division: [4]}],

            [{
                id: 55,
                name: "Port Perry, Lake Scugog",
                city: "Goreski's Landing, Port Perry",
                province: "ON",
                country: "Canada",
                date: DateTime.new(2013, 8, 11)}, {division: [4]}],

            # Central Tour
            [{
                id: 56,
                name: "Hastings, Rice Lake",
                city: "Gazebo Waterfront Park, Hastings",
                province: "ON",
                country: "Canada",
                date: DateTime.new(2013, 6, 29)}, {division: [5]}],

            [{
                id: 57,
                name: "Bridgenorth, Tri-Lakes",
                city: "Rotary Park, Bridgenorth",
                province: "ON",
                country: "Canada",
                date: DateTime.new(2013, 7, 14)}, {division: [5]}],

            [{
                id: 58,
                name: "Lindsay, Sturgeon Lake",
                city: "The Moorings Marina, Snug Harbour",
                province: "ON",
                country: "Canada",
                date: DateTime.new(2013, 8, 10)}, {division: [5]}],

            [{
                id: 59,
                name: "Port Perry, Lake Scugog",
                city: "Goreski's Landing, Port Perry",
                province: "ON",
                country: "Canada",
                date: DateTime.new(2013, 8, 11)}, {division: [5]}],


            # Eastern Tour
            [{
                id: 60,
                name: "Hastings, Rice Lake",
                city: "Gazebo Waterfront Park, Hastings",
                province: "ON",
                country: "Canada",
                date: DateTime.new(2013, 6, 29)}, {division: [6]}],

            [{
                id: 61,
                name: "Hastings, Rice Lake",
                city: "Gazebo Waterfront Park, Hastings",
                province: "ON",
                country: "Canada",
                date: DateTime.new(2013, 6, 30)}, {division: [6]}],

            [{
                id: 62,
                name: "Buster Alyea Trenton, Bay of Quinte",
                city: "Buster Alyea Park, Trenton",
                province: "ON",
                country: "Canada",
                date: DateTime.new(2013, 8, 4)}, {division: [6]}],

            [{
                id: 63,
                name: "Buster Alyea Trenton, Bay of Quinte",
                city: "Buster Alyea Park, Hastings",
                province: "ON",
                country: "Canada",
                date: DateTime.new(2013, 8, 5)}, {division: [6]}],


            # Great Lake Tour
            [{
                id: 66,
                name: "Penetanguishene, Georgian Bay",
                city: "Town Docks, Penetanguishene",
                province: "ON",
                country: "Canada",
                date: DateTime.new(2013, 7, 6)}, {division: [1]}],

            [{
                id: 67,
                name: "Buster Alyea Trenton, Bay of Quinte",
                city: "Buster Alyea Park, Trenton",
                province: "ON",
                country: "Canada",
                date: DateTime.new(2013, 8, 3)}, {division: [1]}],


            # Northwestern Tour
            [{
                id: 68,
                name: "Penetanguishene, Georgian Bay",
                city: "Town Docks, Penetanguishene",
                province: "ON",
                country: "Canada",
                date: DateTime.new(2013, 7, 6)}, {division: [7]}],

            [{
                id: 69,
                name: "Port Severn, Gloucester Pool",
                city: "Port Servern Park, Port Severn",
                province: "ON",
                country: "Canada",
                date: DateTime.new(2013, 7, 7)}, {division: [7]}],

            [{
                id: 70,
                name: "Muskoka Wharf, Lake Muskoka",
                city: "Muskoka Wharf, Gravenhurst",
                province: "ON",
                country: "Canada",
                date: DateTime.new(2013, 7, 20)}, {division: [7]}],

            [{
                id: 71,
                name: "Washago, Couchicing Only ",
                city: "McGregor on the Water, Washago",
                province: "ON",
                country: "Canada",
                date: DateTime.new(2013, 7, 21)}, {division: [7]}],

            # SouthWestern Tour
            # No Events

            # Wildcards Tour
            [{
                id: 72,
                name: "“Casey Cup” Orillia, Lake Simcoe",
                city: "Couchiching Park, Orillia",
                province: "ON",
                country: "Canada",
                date: DateTime.new(2013, 6, 23)}, {division: [3]}],

            [{
                id: 73,
                name: "Bridgenorth, Tri-Lakes",
                city: "Rotary Park, Bridgenorth",
                province: "ON",
                country: "Canada",
                date: DateTime.new(2013, 7, 13)}, {division: [3]}],

            [{
                id: 74,
                name: "Buster Alyea Trenton, Bay of Quinte",
                city: "Buster Alyea Park, Hastings",
                province: "ON",
                country: "Canada",
                date: DateTime.new(2013, 8, 3)}, {division: [3]}],

            [{
                id: 75,
                name: "Coboconk, Balsam Lake",
                city: "Government Docks, Coboconk",
                province: "ON",
                country: "Canada",
                date: DateTime.new(2013, 8, 17)}, {division: [3]}],

            [{
                id: 76,
                name: "Coboconk, Balsam Lake",
                city: "Government Docks, Coboconk",
                province: "ON",
                country: "Canada",
                date: DateTime.new(2013, 8, 18)}, {division: [3]}]
        ]

        events.each do |event|
            id = event.first[:id]

            if Event.exists?(id)
                event.first.delete :id #remove :id from hash
                Event.update id, event.first
            else
                new_event = Event.create event.first
                if new_event.persisted?
                    puts new_event.divisions.size
                    event.last[:division].each { |x| new_event.divisions << Division.find(x) }
                    puts new_event.divisions.size
                end
            end
        end
        puts Event.count
    end

    desc "Creates all the Divisions"
    task :divisions => :environment do

        divisions = [
            { id: 1, name: "Great Lakes Tour" },
            { id: 2, name: "SouthWestern Tour" },
            { id: 3, name: "Wildcards" },
            { id: 4, name: "100 Tour" },
            { id: 5, name: "Central Tour" },
            { id: 6, name: "Eastern Tour" },
            { id: 7, name: "Northwestern Tour" },
        ]

        divisions.each do |division|
            id = division[:id]
            if Division.exists?(id)
                division.delete :id
                Division.update id, division
            else
                Division.create division
            end
        end
    end
end