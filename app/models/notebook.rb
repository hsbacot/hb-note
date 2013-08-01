class Notebook < ActiveRecord::Base

	belongs_to :user
	has_many :notes

	accepts_nested_attributes_for :user, :notes
end
