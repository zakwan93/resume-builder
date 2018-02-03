class SummaryController < ApplicationController

	def index
		@summary = Summary.all
	end

	def show
		@summary = Summary.find(params[:id])
	end

	def new
		@user_resume = User.find(current_user.id).resume.id
		@summary = Summary.new(params[:resume_id])
	end

	def create
		@summary = Summary.create(resume_id: params[:summary][:resume_id],description: params[:summary][:description])
		redirect_to new_skill_path
	end
	
	def edit
		@summary = Summary.find(params[:id])
	end

	def update
		@summary = Summary.find(params[:id])
		@summary.update(resume_id: params[:summary][:resume_id],description: params[:summary][:description])
		redirect_to summary_path
	end

	private

  	def set_resume
    	@resume = Resume.find_by(user: params[:resume_id])
  	end

  	def set_summary
    	@summary = Summary.find_by(resume: params[:id])
  	end
end
