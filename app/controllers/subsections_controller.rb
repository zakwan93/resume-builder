class SubsectionsController < ApplicationController

	def index
		@user_resume_subsections = User.find(current_user.id).resume.subsections
	end

	def show
		@user_resume_subsections = User.find(current_user.id).resume.subsections
	end

	def new
		@section = Section.find(params[:section_id])
		@subsections = Subsection.new
	end

	def create
		@section = Section.find(params[:section_id])
		@subsections = Subsection.create(section_id: @section.id,name: params[:subsection][:name],desc1: params[:subsection][:desc1],desc2: params[:subsection][:desc2], desc3: params[:subsection][:desc3],desc4: params[:subsection][:desc4],date: params[:subsection][:date])
		if @subsections.save
			redirect_to users_path
			flash[:notice] = "Subsection Created"
		else
			render 'subsections/new'
		end
	end
	
	def edit
		@user_resume_subsection = Subsection.find(params[:id])
	end

	def update
		@user_resume_subsection = Subsection.find(params[:id])
		@subsection = Subsection.update(name: params[:subsection][:name],desc1: params[:subsection][:desc1],desc2: params[:subsection][:desc2], desc3: params[:subsection][:desc3],desc4: params[:subsection][:desc4],date: params[:subsection][:date])
		redirect_to users_path
	end

	def destroy
		@user_resume_subsection = Subsection.find(params[:id])
		@user_resume_subsection.delete
		redirect_to users_path
	end

	private

  	def set_resume
    	@resume = Resume.find_by(user: params[:resume_id])
  	end

  	def set_section
  		@sections = Section.find_by(resume: params[:id])
  	end

  	def set_subsection
    	@subsections = Subsection.find_by(section: params[:id])
  	end
end
