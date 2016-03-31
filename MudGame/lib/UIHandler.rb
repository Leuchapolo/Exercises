class UIHandler
	def initialize(game)
		@incorrect = true
		@done = false
		@game = game
	end

	def start

		while @done == false
			puts "----------------------"
			@game.print_status
			@incorrect = true
			while @incorrect == true
				puts "Enter decision: "
				decision = gets.chomp
				#makes him move if its one of 4 letters
				handle_decision(decision)
			end

		end
	end

	def handle_decision(decision)
		if decision == "N" || decision == "S" || decision == "E" || decision == "W"
			if @game.world[@game.player.location].directions[decision] != nil && @game.world[@game.player.location].directions[decision] == "Exit"
				puts "Ok yeah that's fine then just walk out on your problems. @Game over."
				@done = true 
				@incorrect = false
			elsif @game.world[@game.player.location].directions[decision] != nil && @game.world[@game.world[@game.player.location].directions[decision]].locked == false
				@game.move(decision)
				@incorrect = false
			
			elsif @game.world[@game.player.location].directions[decision] != nil && @game.player.inventory.include?("key")
				puts "\nUsing key to open door..."
				@game.move(decision)
				@incorrect = false
			elsif @game.world[@game.player.location].directions[decision] != nil && @game.player.inventory.include?("key") == false
				puts "This door is locked buddy."
			end
		elsif decision[0, 7] == "pick up"
			@game.pick_up(decision[8, decision.length-1])
		elsif decision[0, 3] == "use"
			@game.use(decision[4, decision.length-1])
		elsif decision[0, 4] == "drop"
			@game.drop(decision[5, decision.length-1])
		elsif decision == "inventory"
			@game.inventory
		elsif decision == "exit" || @game.player.location == "Exit"
			@incorrect = false
			@done = true
		end
		if @game.game_over == true 
			@incorrect = false 
			@done = true
		end
	end
end