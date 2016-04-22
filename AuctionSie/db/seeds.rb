# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [{ name: "Fred", email: "Freddy@gmail.com"},
	{ name: "Michael", email: "mikesta@gmail.com"},
	{ name: "Leucha", email: "leucha@gmail.com"},
	{ name: "Colo", email: "Colo@gmail.com"}
]

items = [{ title: "Segway", description: "Really fun party machine", deadline: (Date.current + 3.days)},
	{ title: "Taco", description: "Delicious food", deadline: (Date.current + 5.days)},
	{ title: "Burrito", description: "One of a kind item owned by the queen", deadline: (Date.current + 6.days)},
	{ title: "Jedi Action Figure", description: "Based off the movie star wars. Really just a must buy", deadline: (Date.current + 2.days)}
]

users.each_with_index do |user, index|
	new_user = User.create(user)
	new_user.products.create(items[index])
end

