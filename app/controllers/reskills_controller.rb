class ReskillsController < ApplicationController
	def index
		@user_resume_reskills = User.find(current_user.id).resume.reskills
	end

	def show
		@user_resume_reskills = User.find(current_user.id).resume.reskills
	end

	def new
		@user_resume = User.find(current_user.id).resume.id
		@reskills = Reskill.new(params[:resume_id])
		@user_resume_reskills = current_user.resume.reskills
	end

	def create
		@reskills = Reskill.create(resume_id:params[:reskill][:resume_id],skill_id:params[:reskill][:skill_id])
		redirect_to new_reskill_path
	end
	
	def edit
		@user_resume_reskills = Reskill.find(current_user.id).resume.reskills
	end

	def update
		@user_resume_reskills = Reskill.find(current_user.id).resume.reskills
		@reskills.update_attributes(reskills_params)
		redirect_to users_path
	end

	def destroy
		@user_resume_reskills = Reskill.find(params[:id])
		@user_resume_reskills.delete
		redirect_to resume_path
	end

	private

  	def set_resume
    	@resume = Resume.find_by(user: params[:resume_id])
  	end

  	def set_reskill
    	@reskills = Reskill.find_by(resume: params[:id])
  	end

  	def introduction_params 
  		params.require(:reskill).permit(:resume_id,:skill_id)
  	end
end
