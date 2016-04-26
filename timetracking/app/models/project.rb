class Project < ActiveRecord::Base
	has_many :time_entries
	validates :name, presence: true, uniqueness: true, length: {maximum: 30}, format: { with: /^[A-Za-z0-9]+$/, multiline: true}

	def self.clean_old 
		old_projects = Project.where("created_at < ?", Time.current - 1.week)
		old_projects.destroy_all
	end
end
