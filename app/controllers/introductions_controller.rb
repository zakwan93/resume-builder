class IntroductionsController < ApplicationController

	def index
		# @introductions = Introduction.find(current_user.id).resume.introduction
		@introductions = Introduction.all
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
		if @introductions.save
			redirect_to users_path
			flash[:notice] = "Job Created"
		else
			render 'introductions/new'
		end
    end
	
	def edit
		@introductions = User.find(current_user.id).resume.introduction
	end

	def update
		@introductions = User.find(current_user.id).resume.introduction
		@introductions.update_attributes(introduction_params)
		redirect_to users_path
	end

	def destroy
		@introductions = Introduction.find(params[:id])
		@introductions.destroy
		redirect_to users_path
	end

	private

  	def set_resume
    	@resume = Resume.find_by(user: params[:resume_id])
  	end

  	def set_introduction
    	@introduction = Introduction.find_by(resume: params[:id])
  	end

  	def introduction_params 
  		params.require(:introduction).permit(:name,:title,:address,:phone,:email)
  	end

  
end


