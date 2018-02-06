class UsersController < ApplicationController

  def index
    @user_resume_introductions = User.find(current_user.id).resume.introduction
    @user_resume_objective = User.find(current_user.id).resume.objective
    # # @user_resume_skills = User.find(current_user.id).resume.skills
    @user_resume_experiences = User.find(current_user.id).resume.experiences
    # @user_resume_projects = User.find(current_user.id).resume.projects
    @user_resume_education = User.find(current_user.id).resume.educations
    @user_resume_reskills = User.find(current_user.id).resume.reskills

  end
  
	def new
    	@user = User.new
    	@resume = Resume.new
  end

  def show
    # @user_resume_introduction = User.find(current_user.id).resume.introduction
    @user_resume_introductions = User.find(current_user.id).resume.introduction
    @user_resume_objective = User.find(current_user.id).resume.objective
    @user_resume_reskills = User.find(current_user.id).resume.reskills
    @user_resume_experiences = User.find(current_user.id).resume.experiences
    @user_resume_education = User.find(current_user.id).resume.educations
    # @x = Skill.find(@user_resume_reskills)
    # puts "hello"
    # puts @x
    # puts "hello"

    # @objective = Objective.all
    # # @skills = Skill.find(current_user.id).resume.skills
    # # @skills = @user_resume_skills
    # @skills = Skill.all
    # @experiences = Experience.all
    # # @experiences = Experience.all
    # @projects = Project.all
    # @education = Education.all
    # @reskill = Reskill.all

  end

  def edit
     @user_resume_experiences = User.find(current_user.id).resume.experiences
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

