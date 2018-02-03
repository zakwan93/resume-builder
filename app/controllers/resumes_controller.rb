class ResumesController < ApplicationController


  def index
    @new_resume = Resume.new
    @introduction = Introduction.all
    @objective = Objective.all
    @skill = Skill.all
  end

  def create 
    @new_resume = Resume.create(user_id: params[:resume][:user_id])
    redirect_to new_introduction_path
  end

  def show
    @introductions = Introduction.find(current_user.id).resume.introduction
    @objective = Objective.find(current_user.id).resume.objective
    @skills = Skill.find(current_user.id).resume.skill
  end

  def edit
    @introduction = Introduction.new
    @objective = @resume.objective
    @summary = @resume.summary
    @skills = @resume.skills
  end


  private

  def set_resume
    @resume = Resume.find_by(user: params[:id])
  end

  def set_introduction
      @introduction = Introduction.find_by(resume: params[:id])
  end

  def set_objective
      @objective = Objective.find_by(resume: params[:id])
  end

  def set_skill
      @skills = Skill.find_by(resume: params[:id])
  end
end
