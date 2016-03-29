class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end

homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49),
  Home.new("Mikey's place", "New York", 3, 50),
  Home.new("Al's place", "Tampa", 2, 40),
  Home.new("Carlos's place", "Miami", 4, 48),
  Home.new("Betty's place", "San Juan", 3, 45),
  Home.new("Mark's place", "Miami", 5, 50)

]

puts "\n\n\nHOME LIST:\n"

def print_array(arr)
	arr.each do |home|
		puts home.name + " in " + home.city + " is $" + home.price.to_s
	end
end

sorted_by_price_homes = homes.sort {|x,y| x.price <=> y.price}
print_array(sorted_by_price_homes)

puts "\nEnter 'high-price', 'low-price', 'high-cap', or 'low-cap':"
answer = gets.chomp

if answer == "" || answer == "low-price"
	sorted_categ = sorted_by_price_homes
elsif answer == "high-price"
	 sorted_categ = homes.sort {|x,y| y.price <=> x.price}
elsif answer == "high-cap"
	sorted_categ = homes.sort {|x,y| y.capacity <=> x.capacity}
elsif answer == "low-cap"
	sorted_categ = homes.sort {|x,y| x.capacity <=> y.capacity}
else 
	puts "invalid response"
end

puts "\n\nHOME LIST Organized by " + answer + ":\n" 
print_array(sorted_categ)

puts "\nEnter city to constrain: \n"
city_name = gets.chomp

city_list = homes.select do |home|
	home.city == city_name
end

puts "\nHere are the homes in " + city_name + ":"
print_array(city_list)

total_price = city_list.reduce (0.0) do |sum, city|
	sum + city.price
end

avg_price = total_price/city_list.count
puts "\nAverage price in that area is: \n$" + avg_price.to_s

puts "\nFind home by price. Enter Price: \n"
user_price = gets.chomp.to_i

price_house = homes.find do |home|
	home.price == user_price
end

if price_house != nil
	puts price_house.name
else
	puts "There are no homes for that price"
end

