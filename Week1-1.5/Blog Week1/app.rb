require_relative "lib/Blog.rb"
require_relative "lib/Post.rb"

time1 = Time.new(2016, 3, 29, 8, 45, 24)
time2 = Time.new(2016, 4, 26, 9, 45, 24)
time3 = Time.new(2016, 8, 29, 10, 45, 24)
time4 = Time.new(2016, 4, 3, 3, 56, 21)


post1 = Post.new("Cool Post", time1, "This is a crazy post", false)
post2 = Post.new("Sad Post", time2, "Miss my dog", false)
post3 = Post.new("Crazy Post", time3, "Hey pal", false)
post4 = Post.new("Sponsored Post", time4, "Paid For In Full", true)


blog = Blog.new
blog.add_post(post1)
blog.add_post(post2)
blog.add_post(post3)
blog.add_post(post4)
blog.publish_front_page