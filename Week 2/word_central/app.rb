require_relative('./app/models/word.rb')

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

string = "Hey guys how are you doing? I'm doing really well. Hey have you heard how well I've been doing?"
frequency(string.split(" "))


