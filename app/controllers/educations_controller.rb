class EducationsController < ApplicationController
	def index
		@user_resume_education = User.find(current_user.id).resume.educations
	end

	def show
		@user_resume_education = User.find(current_user.id).resume.educations
	end


	def new
		@user_resume = User.find(current_user.id).resume.id
		@education = Education.new(params[:resume_id])
	end

	def create
		@education = Education.create(resume_id: params[:education][:resume_id],name: params[:education][:name],degree: params[:education][:degree],year_graduated: params[:education][:year_graduated])
		if @education.save
			redirect_to users_path
			flash[:notice] = "Education Created"
		else
			render 'education/new'
		end
    end
	
	def edit
		@user_resume_education = Education.find(params[:id])
	end

	def update
		@user_resume_education = Education.find(params[:id])
		@user_resume_education.update_attributes(education_params)
		redirect_to users_path
	end

	def destroy
		@user_resume_education = Education.find(params[:id])
		@user_resume_education.delete
		redirect_to users_path
	end

	private

	def set_education
    	@education = Education.find_by(resume: params[:id])
  	end

  	def set_resume
    	@resume = Resume.find_by(user: params[:resume_id])
  	end
  	def education_params 
  		params.require(:education).permit(:name,:degree,:year_graduated)
  	end
end
