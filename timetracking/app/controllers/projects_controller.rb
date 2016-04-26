class ProjectsController < ApplicationController
	def index 
		@projects = Project.order(created_at: :desc).limit(10)
		render 'index'
	end

	def show 
		@project = Project.find_by(id: params[:id])

		if @project != nil
			render 'show'
		else
			render "no_projects_found"
		end
		
	end

	def new 
		@project = Project.new
		render 'new'
	end

	def create
		new_project = Project.create(name: params[:project][:name], description: params[:project][:description])
		redirect_to("/projects")
	end
end
