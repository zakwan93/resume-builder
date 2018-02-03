class SkillsController < ApplicationController

	def index
		@skills = Skill.find(current_user.id).resume.skills
	end

	def show
		@skills = Skill.find(current_user.id).resume.skills
	end

	def new
		@user_resume = User.find(current_user.id).resume.id
		@skills = Skill.new(params[:resume_id])
	end

	def create
		@skills = Skill.create(resume_id: params[:skill][:resume_id],name: params[:skill][:name])
		redirect_to users_path
	end
	
	def edit
		@skills= Skill.find(params[:id])
	end

	def update
		@skills = Skill.find(params[:id])
		@skills.update(resume_id: params[:skill][:resume_id],name: params[:skill][:name])
		redirect_to users_path
	end

	private

  	def set_resume
    	@resume = Resume.find_by(user: params[:resume_id])
  	end

  	def set_skill
    	@skills = Objective.find_by(resume: params[:id])
  	end

end
