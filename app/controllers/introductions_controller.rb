class IntroductionsController < ApplicationController

	def index
		@introductions = Introduction.find(current_user.id).resume.introductions
	end

	def show
		@introductions = Introduction.find(current_user.id).resume.introduction
	end


	def new
		@user_resume = User.find(current_user.id).resume.id
		@introductions = Introduction.new(params[:resume_id])
	end

	def create
		@introductions = Introduction.create(resume_id: params[:introduction][:resume_id],name: params[:introduction][:name],title: params[:introduction][:title],address: params[:introduction][:address],phone: params[:introduction][:phone],email: params[:introduction][:email])
		redirect_to users_path
    end
	
	def edit
		@introductions = Introduction.find(params[:id])
	end

	def update
		@introductions = Introduction.find(params[:id])
		@introductions.update(resume_id: params[:introduction][:resume_id],name: params[:introduction][:name],title: params[:introduction][:title],address: params[:introduction][:address],phone: params[:introduction][:phone],email: params[:introduction][:email])
		redirect_to users_path
	end

	def destroy
		@introductions = Introduction.find(current_user.id).resume.introduction
		@introductions.delete
		redirect_to resume_path
	end

	private

  	def set_resume
    	@resume = Resume.find_by(user: params[:resume_id])
  	end

  	def set_introduction
    	@introduction = Introduction.find_by(resume: params[:id])
  	end

  
end


