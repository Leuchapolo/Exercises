require_relative "lib/StringCalculator.rb"

calculator = StringCalculator.new

puts calculator.add("7,6") == 13
puts calculator.add("9,1") == 10
puts calculator.add("5") == 5
puts calculator.add("8") == 8
puts calculator.add("9,1, 3") == 13