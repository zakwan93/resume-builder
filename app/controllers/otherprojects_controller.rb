class OtherprojectsController < ApplicationController
	
	def index
		@user_resume_otherprojects = User.find(current_user.id).resume.otherprojects
	end

	def show
		@user_resume_otherprojects = User.find(current_user.id).resume.otherprojects
	end

	def new
		@user_resume = User.find(current_user.id).resume.id
		@otherprojects = Otherproject.new(params[:resume_id])
	end

	def create
		@otherprojects = Otherproject.create(resume_id: params[:otherproject][:resume_id],name: params[:otherproject][:name],desc1: params[:otherproject][:desc1],desc2: params[:otherproject][:desc2], desc3: params[:otherproject][:desc3],desc4: params[:otherproject][:desc4])
		
		if @otherprojects.save
			redirect_to users_path
			flash[:notice] = "Project Created"
		else
			render 'otherprojects/new'
		end
	end
	
	def edit
		@user_resume_otherproject = Otherproject.find(params[:id])
	end

	def update
		@user_resume_otherproject = Otherproject.find(params[:id])
		@user_resume_otherproject.update_attributes(otherprojects_params)
		redirect_to users_path
	end

	def destroy
		@user_resume_otherproject = Otherproject.find(params[:id])
		@user_resume_otherproject.delete
		redirect_to users_path
	end

	private

  	def set_resume
    	@resume = Resume.find_by(user: params[:resume_id])
  	end

  	def set_otherpoject
    	@otherprojects = Otherproject.find_by(resume: params[:id])
  	end

  	def otherprojects_params 
  		params.require(:otherproject).permit(:resume_id,:name,:desc1,:desc2,:desc3,:desc4)
  	end
end
