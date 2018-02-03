class UsersController < ApplicationController

  def index
    @user_resume_introduction = User.find(current_user.id).resume.introduction
    @user_resume_objective = User.find(current_user.id).resume.objective
    @user_resume_skills = User.find(current_user.id).resume.skills
    
    @user_resume_experiences = User.find(current_user.id).resume.experiences
  end
  
	def new
    	@user = User.new
    	@resume = Resume.new
  	end

  	def create
	    @resume = Resume.new
  	end


  	private
  		def set_user
    		@user = User.find_by(user: params[:id])
  		end

  		def set_resume
    		@resume = Resume.find_by(user_id: session[:user_id])
  		end
end

