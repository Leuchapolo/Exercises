class Post
	attr_accessor :title, :date, :text, :sponsored, :author, :category

	def initialize(title, text, author, category, sponsored = false)
		@title = title
		@date = Time.new
		@text = text
		@author = author
		@sponsored = sponsored
		@category = category
	end


end
