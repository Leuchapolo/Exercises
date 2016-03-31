require_relative "lib/Room.rb"
require_relative "lib/Player.rb"
require_relative "lib/Game.rb"
require_relative "lib/UIHandler.rb"

## i would have done a couple things differently if I was gonna spend more time on it like making an item class and make a message attribute for each


game = Game.new()
done = false 
puts "\nYou awake covered in your own vomit in a mysterious dark room with little to no memory of the night before. You recall that last night was the Ironhackers meetup and things got a bit wild. The last thing you remember is yelling 'I'm Bill Gates now bitch!' from atop the kitchen counter and then from there its all blank. You're still so messed up that you can hardly walk and the only things you can really do are 'pick up' objects that 'you see', 'use' them, or 'drop' them. That and move to the next room. You crawl along the wall until you find a light switch and turn it on.\n\n"
handler = UIHandler.new(game).start

# exit when someone types exit or goes through the exit or when someone wins the game