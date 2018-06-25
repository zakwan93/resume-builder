class Resume < ApplicationRecord
	has_one :introduction
	has_one :summary
	has_one :objective
	has_many :reskills
	has_many :skills, :through => :reskills
	has_many :projects
	has_many :otherprojects
	has_many :educations
	has_many :experiences
	has_many :sections
	has_many :subsections, :through => :sections
	belongs_to :user
end
