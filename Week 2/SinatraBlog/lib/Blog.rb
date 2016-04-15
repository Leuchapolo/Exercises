require_relative "Post.rb"

class Blog 
	attr_accessor :posts
	def initialize 
		@posts = []
	end
	def add_post(post)
		@posts.push(post)
	end

	def latest_posts
		sorted_list = @posts.sort{|x,y| y.date <=> x.date}
		sorted_list
	end


end


