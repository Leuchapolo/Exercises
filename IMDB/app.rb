require "imdb"
require_relative "lib/RatingPrinter.rb"


text_array = IO.read("movies.txt").split("\n")
movie_array = []
text_array.each do |mov|

	movie_array.push(Imdb::Search.new(mov).movies[0])
end

RatingPrinter.new.printer(movie_array)
return_string = "|"
puts "---------------"
text_array.each_with_index do |movie, i|
	return_string += "#{i + 1 }|"
end 
puts return_string
text_array.each_with_index do |movie, i|
	puts (i + 1).to_s + ". " + movie
end