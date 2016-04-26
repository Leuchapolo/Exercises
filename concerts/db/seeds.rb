# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

concerts = [
{artist: "Prince", venue: "Ontario Mega Ball", city: "Ontario", date: (Time.now + 2.days), price: 4000, description: "See the prince himself"},
{artist: "Kanye", venue: "Governor's Ball", city: "New York", date: (Time.now + 2.months), price: 200, description: "See Yeezus himself"},
{artist: "Chance", venue: "Fillmore", city: "Miami", date: (Time.now + 2.weeks), price: 400, description: "Chance acid rapper, soccer hacky sacker"},
{artist: "Beatles", venue: "Coachella", city: "Los Angeles", date: (Time.now + 4.months), price: 100, description: "John Lennon will be projected on a hologram"},
{artist: "TwoPack", venue: "Greenwich Opera House", city: "Greenwich", date: (Time.now), price: 300, description: "I don't know some rapper who wanted to perform here"},
{artist: "The Rolling Stones", venue: "Fillmore", city: "Miami", date: (Time.now), price: 40, description: "Mick Jaggers got moves like Adam Levine"}
]

concerts.each do |concert| 
	Concert.create(concert)
end