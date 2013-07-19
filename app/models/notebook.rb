class Notebook < ActiveRecord::Base

	belongs_to :user
	belongs_to :note

	accepts_nested_attributes_for :user, :note
end
