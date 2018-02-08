class SkillsController < ApplicationController

	def index
		@user_resume_skills = User.find(current_user.id).resume.skills
	end

	def show
		@skills= Skill.find(params[:id])
	end

	def new
		@user_resume = User.find(current_user.id).resume.id
		@skills = Skill.new(params[:resume_id])
	end

	def create
		@skills = Skill.create(name: params[:skill][:name])
		redirect_to users_path
	end
	
	def edit
		
	end

	def update
		@skills = Skill.find(params[:id])
		@skills.update(name: params[:skill][:name])
		redirect_to users_path
	end

	def destroy
		@skills = Skill.find_by(current_user.id).resume.skills
		@skills.delete
		redirect_to resume_path
	end

	private

  	def set_resume
    	@resume = Resume.find_by(user: params[:resume_id])
  	end

  	def set_skill
    	@skills = Objective.find_by(resume: params[:id])
  	end

end
