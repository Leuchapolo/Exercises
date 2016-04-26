class TimeEntriesController < ApplicationController

	def index 
		@my_project = Project.find(params[:id])
		@my_entries = @my_project.time_entries
		if @my_entries[0] != nil
			render 'index'
		else 
			render 'no_entries'
		end
	end

	def new
		@my_project = Project.find(params[:id])
		@project_id = @my_project.id
		@my_entry = @my_project.time_entries.new
		render 'new'
	end

	def create
		@my_project = Project.find(params[:id])
		@my_entry = @my_project.time_entries.new(entry_params)
		if @my_entry.save 
			redirect_to "/projects/#{@my_project.id}/time_entries"
		else
			render "new"
		end
	end

	def edit 
		@my_project = Project.find(params[:project_id])
		@my_entry = @my_project.time_entries.find(params[:id])
		render 'edit'
	end

	def update 
		@my_project = Project.find_by(id: params[:project_id])
		@my_entry = @my_project.time_entries.find_by(id: params[:id])
		if @my_entry.update(entry_params)
			redirect_to "/projects/#{@my_project.id}/time_entries"
		else 
			render 'edit'
		end
	end

	def destroy 
		@my_project = Project.find_by(id: params[:project_id])
		@my_entry = @my_project.time_entries.find_by(id: params[:id])
		@my_entry.destroy
		redirect_to "/projects/#{@my_project.id}/time_entries"
	end


	private 

	def entry_params 
		params.require(:time_entry).permit(:hours, :minutes, :date)
	end

end
