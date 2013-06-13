namespace :load_data do
  desc "loads all of the event data into the database"
  task :events do
    events = [
      {name: "Chippawa, Upper Niagra", date: DateTime.new(2013, 9, 29)},
      {name: "Chippawa, Upper Niagra", date: DateTime.new(2013, 9, 29)},
      {name: "Chippawa, Upper Niagra", date: DateTime.new(2013, 9, 29)},
      {name: "Chippawa, Upper Niagra", date: DateTime.new(2013, 9, 29)},
      {name: "Chippawa, Upper Niagra", date: DateTime.new(2013, 9, 29)},
      {name: "Chippawa, Upper Niagra", date: DateTime.new(2013, 9, 29)},
      {name: "Chippawa, Upper Niagra", date: DateTime.new(2013, 9, 29)},
      {name: "Chippawa, Upper Niagra", date: DateTime.new(2013, 9, 29)},
      {name: "Chippawa, Upper Niagra", date: DateTime.new(2013, 9, 29)},
      {name: "Chippawa, Upper Niagra", date: DateTime.new(2013, 9, 29)},
      {name: "Chippawa, Upper Niagra", date: DateTime.new(2013, 9, 29)},
      {name: "Chippawa, Upper Niagra", date: DateTime.new(2013, 9, 29)},
      {name: "Chippawa, Upper Niagra", date: DateTime.new(2013, 9, 29)},
      {name: "Chippawa, Upper Niagra", date: DateTime.new(2013, 9, 29)},
      {name: "Chippawa, Upper Niagra", date: DateTime.new(2013, 9, 29)},
      {name: "Chippawa, Upper Niagra", date: DateTime.new(2013, 9, 29)},
      {name: "Chippawa, Upper Niagra", date: DateTime.new(2013, 9, 29)},

    ]
    puts events.count
  end
end