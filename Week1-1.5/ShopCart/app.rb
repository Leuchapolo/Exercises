require_relative "lib/ShoppingCart.rb"

cart = ShoppingCart.new
cart.add("apples")
cart.add("oranges")
cart.add("apples")
puts cart.cost