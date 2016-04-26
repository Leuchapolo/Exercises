# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


tacos = [{name: 'Ironhack', description: "Crazy Little Course down in miami"}, {name: 'Tacos', description: "Best food in the world that i need"}, {name: 'Shopping', description: "Get some new clothes for the emporer"}, {name: 'Bike Ride', description: "All the mocha lattes you gotta do pilates"}, {name: 'Read Catcher in the Rye', description: "Book that will really help me rethink my life"}, {name: 'Kill The Phonies', description: "Start with John Lennon"}, {name: 'Bodegon', description: "Pick up some spanish chicks"}]

tacos.each_with_index do |project, index|
	proj = Project.create(project)
	if index % 3 == 0 
		proj.time_entries.create(hours: 3, minutes: 4, comments: "Really worked hard on this one")
		proj.time_entries.create(hours: 3, minutes: 4, comments: "Really worked hard on this one")
	elsif index % 3 == 1
		proj.time_entries.create(hours: 3, minutes: 4, comments: "Really worked hard on this one", date: (Date.current - index.days))
	end
end


