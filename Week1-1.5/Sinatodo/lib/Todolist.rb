require 'yaml/store'

class Todolist
    attr_reader :tasks, :user
    def initialize(user)
    	@todo_store = YAML::Store.new("./public/tasks.yml")
        @tasks = []
        @user = user
    end

    def add_task(task)
    	@tasks.push(task)
    end

    def delete_task(num)
    	@tasks.delete_if do |task|
    		task.id == num
    	end
    end

    def find_task_by_id(id)
    	index = @tasks.index do |task|
    		task.id == id 
    	end
    	if index != nil
    		@tasks[index]
		else
			nil
		end
    end

    

    def sort
    	sorted_array = @tasks.sort { |x,y| x.created_at <=> y.created_at}
    	sorted_array
    end

    def save
  		@todo_store.transaction do 
    		@todo_store[@user] = @tasks
  		end
	end

	def load
  		@todo_store.transaction do 
    		@tasks = @todo_store[@user] 
  		end
	end


end