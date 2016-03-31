class Room
	attr_accessor :directions, :name, :contents, :description, :locked
	def initialize(name, directions, contents, description)
		@name = name 
		@directions = directions
		@contents = contents
		@description = description
		if name == "Utility Closet"
			@locked = true
		else 
			@locked = false
		end
	end


end