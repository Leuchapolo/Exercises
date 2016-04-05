require_relative "Person.rb"

me = Person.new("Michael", 20)

puts me.name + " " + me.age.to_s