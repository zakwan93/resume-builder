class ObjectivesController < ApplicationController
	
	def index
		@objective = Objective.find(current_user.id).resume.objective
	end

	def show
		@objective = Objective.find(current_user.id).resume.objective
	end

	def new
		@user_resume = User.find(current_user.id).resume.id
		@objective = Objective.new(params[:resume_id])
	end

	def create
		@objective = Objective.create(resume_id: params[:objective][:resume_id],description: params[:objective][:description])
		redirect_to users_path
	end
	
	def edit
		@objective = Objective.find(params[:id])
	end

	def update
		@objective = Objective.find(params[:id])
		@objective.update(resume_id: params[:objective][:resume_id],description: params[:objective][:description])
		redirect_to users_path
	end

	def destroy
		@objective = Objective.find(current_user.id).resume.objective
		@objective.delete
		redirect_to resume_path
	end

	private

  	def set_resume
    	@resume = Resume.find_by(user: params[:resume_id])
  	end

  	def set_objective
    	@objective = Objective.find_by(resume: params[:id])
  	end
end
