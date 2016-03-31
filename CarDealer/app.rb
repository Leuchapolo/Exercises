require_relative "lib/Car.rb"
require_relative "lib/car_dealer.rb"

car1 = Car.new("Fiesta", "Ford")
car2 = Car.new("F-150", "Ford")
car3 = Car.new("GT", "Ford")
car4 = Car.new("Camry", "Toyota")
car5 = Car.new("R8", "Audi")
car6 = Car.new("A4", "Audi")


inventory = 
{
"Ford" => [car1, car2, car3],
"Toyota" => [car4],
"Audi" => [car5, car6]
}

dealer = CarDealer.new(inventory)
dealer.cars("Ford")
