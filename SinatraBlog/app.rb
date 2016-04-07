require "sinatra"
require_relative "lib/Blog.rb"
require_relative "lib/Post.rb"

blog = Blog.new
post1 = Post.new("My first post", "Holy cow I'm instafamous", "Michael", "Important")
post2 = Post.new("Fame", "I can't handle all of the publicity", "Mikester", "Importante")
blog.add_post(post1)
blog.add_post(post2)

get '/' do 
	@blog = blog
	erb :home
end

get '/post_deats/:index' do 
	@blog = blog
	@post = @blog.latest_posts[params[:index].to_f]
	erb :post_deats
end

post "/new_post" do
	@blog = blog
	new_post = Post.new(params[:title], params[:text], params[:author], params[:category])
	@blog.add_post(new_post)
	redirect to("/")
end
