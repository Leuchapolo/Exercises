require_relative "../lib/FizzBuzz.rb"

RSpec.describe "FizzBuzz" do 
	before :each do 
		@fiz = FizzBuzz.new
	end
	it "returns the number when its not a multiple of 3 or 5" do 
		expect(@fiz.fizz(7)).to eq(7)
		expect(@fiz.fizz(11)).to eq(11)
	end
	it "returns Fizz when its a multiple of 3" do 
		expect(@fiz.fizz(3)).to eq("Fizz")
		expect(@fiz.fizz(6)).to eq("Fizz")
	end
	it "returns Buzz when its a multiple of 5" do 
		expect(@fiz.fizz(5)).to eq("Buzz")
		expect(@fiz.fizz(10)).to eq("Buzz")
	end
	it "returns FizzBuzz when its a multiple of 5 and 3" do 
		expect(@fiz.fizz(15)).to eq("FizzBuzz")
		expect(@fiz.fizz(30)).to eq("FizzBuzz")
	end

end