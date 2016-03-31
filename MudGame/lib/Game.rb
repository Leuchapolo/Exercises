require_relative "Player.rb"
require_relative "Room.rb"

class Game 
	attr_accessor :world, :player, :game_over
	def initialize(world)
		@player = Player.new
		@world = world
		@game_over = false
	end
	def print_status
		puts ""
		puts "You are in the " + @player.location + ". " + "There is " + world[@player.location].description 
		world[@player.location].contents.each do |index, value|
			puts "You see " + value
		end
		puts ""
		world[@player.location].directions.each do |index, value|
			if value != nil
				puts "There is a door in the " + index + " direction leading to " + value

			end
		end
		puts ""
	end

	def pick_up(object)
		if world[@player.location].contents.include?(object)
			puts "You picked up a " + object
			@player.inventory.push(object)
			world[@player.location].contents.delete(object)
		end
	end

	def use(object)
		if @player.inventory.include?(object)
			if object == "key" 
				puts "You don't need to 'use' it. Just go open the door."
			elsif object == "penny"
				puts "As soon as you use the lucky penny it vanishes into thin air leaving only a diamond with the same radius in it's place"
				@player.inventory.delete(object)
				@player.inventory.push("Diamond")
			elsif object == "Diamond"
				puts "Don't 'use' it! Sell it!"
			elsif object == "beer"
				puts "You take a sip of the beer and immediately regret it due to last night's shenanigans"
			elsif object == "paper towels"
				puts "You walk over to the sink and wash up with paper towels to make yourself somewhat presentable"
			elsif object == "mop and bucket" && @player.location != "Men's Bathroom"
				puts "You're a nice guy and all for cleaning here but you should really prioritize and clean up the bathroom."
			elsif object == "dufflebag"
				puts "You should probably keep that low-key for a little while"
			elsif object == "mop and bucket" 
				puts "Holy cow you cleaned it up and beat the game congratulations"
				@game_over = true
			end

		end
	end

	def drop(object)

		if @player.inventory.include?(object)

			@player.inventory.delete(object)
			world[@player.location].contents[object] = "a " + object + " sitting on the floor."
		end
	end
	def move(direction)
		@player.location = @world[@world[@player.location].directions[direction]].name
	end
	def inventory
		return_string = "You have: "
		@player.inventory.each do |item|
			return_string += "1 " + item + ", "
		end
		return_string += " and 1 missing cell phone."
		puts return_string
	end

	
end