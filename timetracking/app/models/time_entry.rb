class TimeEntry < ActiveRecord::Base
	belongs_to :projects 
	validates :hours, presence: true, numericality: true 
	validates :minutes, presence: true, numericality: true 
	validates_associated :projects
	
end
