class Note < ActiveRecord::Base

	belongs_to :notebook

	accepts_nested_attributes_for :notebook
end
