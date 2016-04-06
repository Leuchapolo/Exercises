#Inside of server.rb
require 'sinatra'

# We're going to need to require our class files
require_relative('lib/Task.rb')
require_relative('lib/Todolist.rb')

todo_list = Todolist.new("Michael")
todo_list.load 

get "/" do 
	@name = todo_list.user
	@todo_list = todo_list.tasks
	@show_add = false
	erb :home
end

post "/" do
	todo_list.add_task(Task.new(params[:new_todo])) 
	todo_list.save
	@name = todo_list.user
	@todo_list = todo_list.tasks
	@show_add = false
	erb :home
end


post "/complete_change" do
	if params[:delete] != nil
		todo_list.delete_task(todo_list.tasks[params[:item].to_i].id)
	else
		if todo_list.tasks[params[:item].to_i].complete?
			 todo_list.tasks[params[:item].to_i].incomplete!
		else 
			todo_list.tasks[params[:item].to_i].complete!
		end
	end
	todo_list.save
	redirect to("/")
end

post "/add_todo" do 
	@name = todo_list.user
	@todo_list = todo_list.tasks
	@show_add = true
	erb :home
end
