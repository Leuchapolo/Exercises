class Room
	attr_accessor :directions, :name, :contents, :description, :locked
	def initialize(name, directions, contents, description)
		@name = name 
		@directions = directions
		@contents = contents
		@description = description
		lock_utility_closet
	end
	def lock_utility_closet
		if name == "Utility Closet"
			@locked = true
		else 
			@locked = false
		end
	end


end