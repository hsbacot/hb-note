class Note < ActiveRecord::Base

	has_one :user, through: :notebooks
	has_one :notebook

	accepts_nested_attributes_for :user, :notebook
end
