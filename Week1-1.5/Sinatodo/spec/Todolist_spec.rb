require_relative "../lib/Todolist.rb"
require_relative "../lib/Task.rb"

RSpec.describe "Todolist" do 
	before :each do
		@todo = Todolist.new("Michael")
	end
	describe "#add_task" do 
		it "adds the task onto the end of the task array" do
			task = Task.new("Buy Tacos")
			@todo.add_task(task)
			expect(@todo.tasks).to eq([task])
		end
	end

	describe "#delete_task" do 
		it "Deletes the task at the given index" do
			task1 = Task.new("Buy Tacos")
			@todo.add_task(task1)
			task2 = Task.new("Eat Tacos")
			@todo.add_task(task2)
			@todo.delete_task(task1.id)
			task3 = Task.new("Buy Salsa")
			@todo.add_task(task3)
			expect(@todo.tasks).to eq([task2, task3])

		end
	end
	describe "#find_task_by_id" do 
		it "Returns the task at the given index" do
			task1 = Task.new("Buy Tacos")
			@todo.add_task(task1)
			task2 = Task.new("Eat Tacos")
			@todo.add_task(task2)
			expect(@todo.find_task_by_id(task2.id)).to eq(task2)
			expect(@todo.find_task_by_id(@todo.tasks.length)).to eq(nil)
		end
	end

	describe "#sort" do 
		it "sorts the task array by date" do
			task1 = Task.new("Buy Tacos")
			task2 = Task.new("Eat Tacos")
			@todo.add_task(task2)
			@todo.add_task(task1)
			expect(@todo.sort).to eq([task1, task2])
		end
	end

	describe "#save and #load" do 
		it "saves and then loads the same data" do 
			@todo.add_task(Task.new("Walk the dog"))
			@todo.add_task(Task.new("Buy the milk"))
			@todo.add_task(Task.new("Make my todo list into a web app"))
			ole_todo = @todo.tasks[1].id
			@todo.save
			new_todo = Todolist.new("Michael")
			new_todo.load
			expect(new_todo.tasks[1].id).to eq(ole_todo)
		end
	end


end
