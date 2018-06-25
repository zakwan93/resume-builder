class SectionsController < ApplicationController
	def index
		@user_resume_sections = User.find(current_user.id).resume.sections
	end

	def show
		@user_resume_sections = User.find(current_user.id).resume.sections
	end

	def new
		@user_resume = User.find(current_user.id).resume.id
		@sections = Section.new(params[:resume_id])
	end

	def create
		@sections = Section.create(resume_id: params[:section][:resume_id],name: params[:section][:name])
		
		if @sections.save
			redirect_to users_path
			flash[:notice] = "Section Created"
		else
			render 'sections/new'
		end
	end
	
	def edit
		@user_resume = User.find(current_user.id).resume.id
		@user_resume_section = Section.find(params[:id])
	end

	def update
		@user_resume_section = Section.find(params[:id])
		@user_resume_section.update_attributes(sections_params)
		redirect_to users_path
	end

	def destroy
		@user_resume_section = Section.find(params[:id])
		@user_resume_section.delete
		redirect_to users_path
	end

	private

  	def set_resume
    	@resume = Resume.find_by(user: params[:resume_id])
  	end

  	def set_section
    	@sections = Section.find_by(resume: params[:id])
  	end

  	def sections_params 
  		params.require(:section).permit(:resume_id,:name)
  	end

end
