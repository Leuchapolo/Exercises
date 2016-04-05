class Task
	attr_accessor :id, :content, :completed, :created_at
	@@current_id = 1

	def initialize(content)
		@content = content
		@id = @@current_id
		@created_at = Time.new
		@updated_at = nil
		@@current_id += 1 
		@completed = false
	end

	def complete?
		@completed
	end

	def complete!
		@completed = true
	end

	def incomplete!
		@completed = false
	end

	def update_content(new_content)
		@updated_at = Time.new
		@content = new_content
	end
end