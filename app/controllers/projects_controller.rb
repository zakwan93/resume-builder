class ProjectsController < ApplicationController

	def index
		@projects = Project.find(current_user.id).resume.project
	end

	def show
		@projects = Project.find(current_user.id).resume.project 
	end


	def new
		@user_resume = User.find(current_user.id).resume.id
		@projects = Project.new(params[:resume_id])
	end

	def create
		@projects = Project.create(resume_id: params[:project][:resume_id],experience_id: params[:project][:experience_id],name: params[:project][:name],description: params[:project][:description])
		if @projects.save
			redirect_to users_path
			flash[:notice] = "Project Created"
		else
			render 'projects/new'
		end
    end
	
	def edit
		# @projects = Project.find(params[:experiance.id][:id])
		@projects = Project.find(params[:id])
	end

	def update
		@projects = Project.find(params[:id])
		@projects.update(resume_id: params[:project][:resume_id],experience_id: params[:project][:experience_id],name: params[:project][:name],description: params[:project][:description])
		redirect_to users_path
	end

	def destroy
		@projects = Project.find(current_user.id).resume.project
		@projects.delete
		redirect_to resume_path
	end

	private

	def set_project
    	@projects = Project.find_by(resume: params[:id])
  	end

  	def set_experiences
    	@experiences = Experience.find_by(resume: params[:id])
  	end

  	def set_resume
    	@resume = Resume.find_by(user: params[:resume_id])
  	end

end
