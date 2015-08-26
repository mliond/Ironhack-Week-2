require_relative "./calculator.rb"

RSpec.describe Calculator do
	it "should return 0 when adding empty string" do
		calculator = Calculator.new("")
		expect(calculator.add).to eq(0)
	end
	it "should return the number when adding one number" do
		calculator = Calculator.new("5")
		expect(calculator.add).to eq(5)
	end
	it "should return the sum when adding two numbers" do
		calculator = Calculator.new("2,78")
		expect(calculator.add).to eq(80)
	end

end