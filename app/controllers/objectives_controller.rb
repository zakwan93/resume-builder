class ObjectivesController < ApplicationController
	
	def index
		@objective = User.find(current_user.id).resume.objective
	end

	def show
		@objective = User.find(current_user.id).resume.objective
	end

	def new
		@user_resume = User.find(current_user.id).resume.id
		@objective = Objective.new(params[:resume_id])
	end

	def create
		@objective = Objective.create(resume_id: params[:objective][:resume_id],description: params[:objective][:description])
		if @objective.save
			redirect_to users_path
			flash[:notice] = "Job Created"
		else
			render 'objective/new'
		end
	end
	
	def edit
		@objective = User.find(current_user.id).resume.objective
	end

	def update
		@objective = User.find(current_user.id).resume.objective
		@objective.update_attributes(objective_params)
		redirect_to users_path
	end

	def destroy
		@objective = User.find(current_user.id).resume.objective
		@objective.destroy
		redirect_to users_path
	end

	private

  	def set_resume
    	@resume = Resume.find_by(user: params[:resume_id])
  	end

  	def set_objective
    	@objective = Objective.find_by(resume: params[:id])
  	end

  	def objective_params 
  		params.require(:objective).permit(:description)
  	end

end
