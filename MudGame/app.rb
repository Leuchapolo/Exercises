require_relative "lib/Room.rb"
require_relative "lib/Player.rb"
require_relative "lib/Game.rb"

## i would have done a couple things differently if I was gonna spend more time on it like making an item class and make a message attribute for each
world = 
{
	"Men's Bathroom" => Room.new("Men's Bathroom", {"N" => nil, "S" => "Hallway", "E" => nil, "W" => nil }, { "paper towels" => "'paper towels' you can wash and dry yourself off with"}, "hardly any light but throw up everywhere. There is also a toilet in the corner. Oh god, you're gonna be in so much trouble if you don't find a mop and bucket to clean this up."),
	"Hallway" => Room.new("Hallway", {"N" => "Men's Bathroom", "S" => "Women's Bathroom", "E" => "Kitchen", "W" => "Utility Closet" }, {}, "a glow of light that overwhelms your eyes as you enter. You stumble over a broken coffee machine that seems to have been thrown on the ground."),
	"Utility Closet" => Room.new("Utility Closet", {"N" => nil, "S" => nil, "E" => "Hallway", "W" => nil}, {"mop and bucket" => "The thing you've been looking for! The 'mop and bucket'!!"}, "a cluttered mess of presumably useful items although dimly lit."),
	"Women's Bathroom" => Room.new("Women's Bathroom", {"N" => "Hallway", "S" => nil, "E" => nil, "W" => nil}, {}, "no pee on the seat or any mess in general really. God I wish guys knew how to maintain bathrooms like this."),
	"Kitchen" => Room.new("Kitchen", {"N" => "Classroom", "S" => "Outside", "E" => "Exit", "W" => "Hallway"}, {"beer" => "a freshly tapped cup of 'beer' sitting on the counter"}, "more than enough food and drink than you'd most likely need in a day and most importantly beer. In fact,"),
	"Classroom" => Room.new("Classroom", {"N" => nil, "S" => "Kitchen", "E" => nil, "W" => "Office"}, {}, "a bunch of empty desks and chairs"),
	"Office" => Room.new("Office", {"N" => nil, "S" => nil, "E" => "Classroom", "W" => nil}, {"dufflebag" => "a sketchy 'dufflebag' filled with $600,000. However, there is a note with your first and last name on it.", "key" => "a 'key' sitting on the desk"}, "a bunch of computers, desks and whiteboards. On the whiteboard somebody drew 'Tim was here.'"),
	"Outside" => Room.new("Outside", {"N" => "Kitchen", "S" => nil, "E" => nil, "W" => nil}, {"penny" => "a lucky 'penny'. Nice!"}, "a heroic figure tossing bags into the cornhole goals. After seeing that he has made every shot so far you realize this man is none other than Bossman Ariel himself. He mentions that he has also had a similar situation before and that as long as you clean it up you're fine. He mentions that there's a mop and bucket in the Utility Closet and that he last gave the keys to Alia and they should be on his desk.")
}

game = Game.new(world)
done = false 
puts "\nYou awake covered in your own vomit in a mysterious dark room with little to no memory of the night before. You recall that last night was the Ironhackers meetup and things got a bit wild. The last thing you remember is yelling 'I'm Bill Gates now bitch!' from atop the kitchen counter and then from there its all blank. You're still so messed up that you can hardly walk and the only things you can really do are 'pick up' objects that 'you see', 'use' them, or 'drop' them. That and move to the next room. You crawl along the wall until you find a light switch and turn it on.\n\n"
while done == false
	puts "----------------------"
	game.print_status
	incorrect = true
	while incorrect == true
		puts "Enter decision: "
		decision = gets.chomp
		#makes him move if its one of 4 letters
		if decision == "N" || decision == "S" || decision == "E" || decision == "W"
			if game.world[game.player.location].directions[decision] != nil && game.world[game.player.location].directions[decision] == "Exit"
				puts "Ok yeah that's fine then just walk out on your problems. Game over."
				done = true 
				incorrect = false
			elsif game.world[game.player.location].directions[decision] != nil && game.world[game.world[game.player.location].directions[decision]].locked == false
				game.move(decision)
				incorrect = false
			
			elsif game.world[game.player.location].directions[decision] != nil && game.player.inventory.include?("key")
				puts "\nUsing key to open door..."
				game.move(decision)
				incorrect = false
			elsif game.world[game.player.location].directions[decision] != nil && game.player.inventory.include?("key") == false
				puts "This door is locked buddy."
			end
		elsif decision[0, 7] == "pick up"
			game.pick_up(decision[8, decision.length-1])
		elsif decision[0, 3] == "use"
			game.use(decision[4, decision.length-1])
		elsif decision[0, 4] == "drop"
			game.drop(decision[5, decision.length-1])
		elsif decision == "inventory"
			game.inventory
		elsif decision == "exit" || game.player.location == "Exit"
			incorrect = false
			done = true
		end
		if game.game_over == true 
			incorrect = false 
			done = true
		end
			
	end

end

# exit when someone types exit or goes through the exit or when someone wins the game