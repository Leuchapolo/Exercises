class Bid < ActiveRecord::Base
	belongs_to :user
	belongs_to :product
	validates :user_id, numericality: {greater_than: 0}
end
