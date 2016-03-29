require_relative "Post.rb"

class Blog 

	def initialize 
		@post_list = []
	end
	def add_post(post)
		@post_list.push(post)
	end

	def publish_front_page
		sorted_list = @post_list.sort{|x,y| y.date <=> x.date}
		pages = []
		page_index = -1
		sorted_list.each_with_index do |post, i|
			if i % 3 == 0
				page_index += 1
				pages[page_index] = []
			end
			pages[page_index][i%3] = post
			
		end
		page_cursor = 0
		finished = false

		while finished == false
			page = pages[page_cursor]
			if page != nil
				page.each do |item|

					puts "-----------"

					if item.sponsored == true
						puts "******" + item.title + "******"
					else
						puts item.title
					end

					puts "******"
					puts item.text
				end
				puts "-----------"
			end

			puts "Enter 'next', 'prev', or 'exit': "
			
			prompt_done = false
			while prompt_done == false
				response = gets.chomp
				if response == "exit"
					finished = true
					prompt_done = true
				elsif response == "next"
					page_cursor += 1 
					prompt_done = true
				elsif response == "prev"
					page_cursor -= 1
					prompt_done = true
				else
					puts "incorrect prompt"
				end
			end

		end

	end

end


