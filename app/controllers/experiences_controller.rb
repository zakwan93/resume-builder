class ExperiencesController < ApplicationController

	def index
		@user_resume_experiences = User.find(current_user.id).resume.experiences
	end

	def show
		@user_resume_experiences = User.find(current_user.id).resume.experiences
	end


	def new
		@user_resume = User.find(current_user.id).resume.id
		@experiences = Experience.new(params[:resume_id])

	end

	def create
		@experiences = Experience.create(resume_id: params[:experience][:resume_id],job_title: params[:experience][:job_title],company: params[:experience][:company],startdate: params[:experience][:startdate],enddate: params[:experience][:enddate],description: params[:experience][:description])
		
		if @experiences.save
			redirect_to users_path
			flash[:notice] = "Job Created"
		else
			render 'experiences/new'
		end
    end

	def edit
		@user_resume_experience = Experience.find(params[:id])
	end

	def update
		@user_resume_experience = Experience.find(params[:id])
		@user_resume_experience.update_attributes(experience_params)
		redirect_to users_path
	end

	def destroy
		@user_resume_experience = Experience.find(params[:id])
		@user_resume_experience.delete
		redirect_to users_path
	end

	private

  	def set_resume
    	@resume = Resume.find_by(user: params[:resume_id])
  	end

  	def set_experience
    	@experiences = Experience.find_by(resume: params[:id])
  	end

  	def experience_params 
  		params.require(:experience).permit(:job_title,:company,:startdate,:enddate,:description)
  	end


end
