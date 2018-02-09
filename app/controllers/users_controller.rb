class UsersController < ApplicationController

  def index
    @user_resume_introductions = current_user.resume.introduction
    @user_resume_objective = current_user.resume.objective
    @user_resume_experiences = current_user.resume.experiences
    @user_resume_otherprojects = current_user.resume.otherprojects
    @user_resume_education = current_user.resume.educations
    @user_resume_reskills = current_user.resume.reskills

     respond_to do |format|
      format.html
      format.pdf do 
        # render pdf: 'resume',
        #      template: 'users/show.html.erb',
        #      locals: {:intro => @user_resume_introductions}
        pdf = render_to_string pdf: 'resume',
                              template: 'users/show.html.erb',
                              encoding: 'utf-8'
        send_data(pdf, filename: 'resume.pdf', type: 'application/pdf', desposition: 'attachment')
      end
    end
  end
  
	def new
    	@user = User.new
    	@resume = Resume.new
  end

  def show
    @user_resume_introductions = current_user.resume.introduction
    @user_resume_objective = current_user.resume.objective
    @user_resume_reskills = current_user.resume.reskills
    @user_resume_experiences = current_user.resume.experiences
    @user_resume_otherprojects = current_user.resume.otherprojects
    @user_resume_education = current_user.resume.educations
  end

  def edit
    @user_resume_introductions = current_user.resume.introduction
    @user_resume_objective = current_user.resume.objective
    @user_resume_reskills = current_user.resume.reskills
    @user_resume_experiences = current_user.resume.experiences
    @user_resume_otherprojects = current_user.resume.otherprojects
    @user_resume_education = current_user.resume.educations
  end

  def create
	    @resume = Resume.new
  end

  def review

  end

  	private
  		def set_user
    		@user = User.find_by(user: params[:id])
  		end

  		def set_resume
    		@resume = Resume.find_by(user_id: session[:user_id])
  		end
end

