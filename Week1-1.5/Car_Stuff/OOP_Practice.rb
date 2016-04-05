#OOP_Practice.rb

require_relative "lib/Car.rb"


carro = Car.new("Michale's Car", "Broom", "Madza", "Madza Rella")
carro.visit_city("Amsterdam")
carro.visit_city("Ibiza")
carro.visit_city("Emerald City")

otro_carro = Car.new("Michale's Car", "Broom", "Madza", "Madza Rella")
otro_carro.visit_city("Amsterdam")
otro_carro.visit_city("Ibiza")
otro_carro.visit_city("Emerald City")
puts otro_carro.total_cities
