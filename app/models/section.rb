class Section < ApplicationRecord
	has_many :subsections
	belongs_to :resume
end
