require "rspec"
require_relative "../lib/Blog.rb"
require_relative "../lib/Post.rb"



RSpec.describe "Blog" do 
	before :each do 
		@blog = Blog.new
		@post1 = Post.new("My first post", "Holy cow I'm instafamous")
		@post2 = Post.new("Fame", "I can't handle all of the publicity")
		@blog.add_post(@post1)
		@blog.add_post(@post2)
	end
	it "should return an array of the posts added when posts is called" do 
		expect(@blog.posts).to eq([@post1, @post2])
	end

	it "should return an array of the posts sorted by latest when latest_posts is called" do 
		expect(@blog.latest_posts).to eq([@post2, @post1])
	end

end 

