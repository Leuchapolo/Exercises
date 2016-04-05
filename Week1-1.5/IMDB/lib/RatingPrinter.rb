class RatingPrinter
	def printer(movies)
		num_arrary = [10, 9, 8, 7, 6, 5, 4, 3 ,2 , 1]
		num_arrary.each do |i|
			row_string = "|"
			movies.each do |movie|
				
				if i > movie.rating
				 	row_string += " |"
				else
				 	row_string += "#|"
				end
			end
			puts row_string
		end

	end

end
