require_relative "Player.rb"
require_relative "Room.rb"

class Game 
	attr_accessor :world, :player, :game_over
	def initialize()
		@player = Player.new
		@world = make_world
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
			elsif object == "diamond"
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

	def make_world
		world = {
				"Men's Bathroom" => Room.new("Men's Bathroom", {"N" => nil, "S" => "Hallway", "E" => nil, "W" => nil }, { "paper towels" => "'paper towels' you can wash and dry yourself off with"}, "hardly any light but throw up everywhere. There is also a toilet in the corner. Oh god, you're gonna be in so much trouble if you don't find a mop and bucket to clean this up."),
				"Hallway" => Room.new("Hallway", {"N" => "Men's Bathroom", "S" => "Women's Bathroom", "E" => "Kitchen", "W" => "Utility Closet" }, {}, "a glow of light that overwhelms your eyes as you enter. You stumble over a broken coffee machine that seems to have been thrown on the ground."),
				"Utility Closet" => Room.new("Utility Closet", {"N" => nil, "S" => nil, "E" => "Hallway", "W" => nil}, {"mop and bucket" => "The thing you've been looking for! The 'mop and bucket'!!"}, "a cluttered mess of presumably useful items although dimly lit."),
				"Women's Bathroom" => Room.new("Women's Bathroom", {"N" => "Hallway", "S" => nil, "E" => nil, "W" => nil}, {}, "no pee on the seat or any mess in general really. God I wish guys knew how to maintain bathrooms like this."),
				"Kitchen" => Room.new("Kitchen", {"N" => "Classroom", "S" => "Outside", "E" => "Exit", "W" => "Hallway"}, {"beer" => "a freshly tapped cup of 'beer' sitting on the counter"}, "more than enough food and drink than you'd most likely need in a day and most importantly beer. In fact,"),
				"Classroom" => Room.new("Classroom", {"N" => nil, "S" => "Kitchen", "E" => nil, "W" => "Office"}, {}, "a bunch of empty desks and chairs"),
				"Office" => Room.new("Office", {"N" => nil, "S" => nil, "E" => "Classroom", "W" => nil}, {"dufflebag" => "a sketchy 'dufflebag' filled with $600,000. However, there is a note with your first and last name on it.", "key" => "a 'key' sitting on the desk"}, "a bunch of computers, desks and whiteboards. On the whiteboard somebody drew 'Tim was here.'"),
				"Outside" => Room.new("Outside", {"N" => "Kitchen", "S" => nil, "E" => nil, "W" => nil}, {"penny" => "a lucky 'penny'. Nice!"}, "a heroic figure tossing bags into the cornhole goals. After seeing that he has made every shot so far you realize this man is none other than Bossman Ariel himself. He mentions that he has also had a similar situation before and that as long as you clean it up you're fine. He mentions that there's a mop and bucket in the Utility Closet and that he last gave the keys to Alia and they should be on his desk.")
			}
	end
	
end