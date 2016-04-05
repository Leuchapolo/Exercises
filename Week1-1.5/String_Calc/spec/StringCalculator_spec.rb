require_relative "../lib/StringCalculator.rb"

RSpec.describe "String calculator" do 
	it "returns the sum when given multiple numbers" do
		calculator = StringCalculator.new

		expect(calculator.add("1,2,3,4")).to eq(10)
		expect(calculator.add("25,25,25")).to eq(75)
		expect(calculator.add("")).to eq(0)
		expect(calculator.add("1,2,3")).to eq(6)
		expect(calculator.add("1,3")).to eq(4)
		expect(calculator.add("5")).to eq(5)

	end
end