class Skill < ApplicationRecord
	has_many :reskills
	has_many :resume, :through => :reskills
end
