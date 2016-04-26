require_relative('../models/word.rb')

class TextInspectorController < ApplicationController
	def new 
		render "text_inspect"
	end

	def inspect
		@user_text = params[:text_inspection][:user_text]
		text_list = @user_text.split(" ")
		@top_ten = frequency(text_list)
		@count = text_list.length
		@time = (@count/275).to_f
		render "inspect_text"
	end


	def frequency(text_list)
		words = []
		top_ten = []
		text_list.each do |wordName|
			spot = words.index do |wird| 
				wird.name == wordName

			end
			if spot == nil
				newWord = Word.new(wordName, 1)
				words.push(newWord)
			else 
				words[spot].count += 1
			end
		end
		sorted = words.sort do |x, y| 
			y.count <=> x.count
		end
		sorted.each_with_index do |word, index|
			if index <= 9
				top_ten.push(word)
			else 
				break
			end
		end

		top_ten
	end

end
