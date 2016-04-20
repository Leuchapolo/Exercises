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
end
