class ExperiencesController < ApplicationController

	def index

		@experiences = Experience.find(current_user.id).resume.experiences

	end

	def show
		@experiences = Experience.find(current_user.id).resume.experience
	end


	def new
		@user_resume = User.find(current_user.id).resume.id
		@experiences = Experience.new(params[:resume_id])

	end

	def create
		@experiences = Experience.create(resume_id: params[:experience][:resume_id],job_title: params[:experience][:job_title],company: params[:experience][:company],city: params[:experience][:city],state: params[:experience][:state],duration: params[:experience][:duration])
		redirect_to users_path
		if @experiences.save
			redirect_to users_path
			flash[:notice] = "Job Created"
		else
			render 'experiences/new'
		end
    end

	def edit
		# @experiences = current_user.resume.experiences.find(params[:id])
		@experiences = Experience.find(params[:id])
	end

	def update
		@experiences = Experience.find(params[:id])
		Experience.create(resume_id: params[:experience][:resume_id],job_title: params[:experience][:job_title],company: params[:experience][:company],city: params[:experience][:city],state: params[:experience][:state],duration: params[:experience][:duration])
		redirect_to users_path
	end

	def destroy
		@experiences = Experience.find(current_user.id).resume.introduction
		@experiences.delete
		redirect_to resume_path
	end

	private

  	def set_resume
    	@resume = Resume.find_by(user: params[:resume_id])
  	end

  	def set_experience
    	@experiences = Experience.find_by(resume: params[:id])
  	end

end
