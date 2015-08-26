require_relative "../lib/calculator.rb"

RSpec.describe Calculator do
	before :all do # you can do before do (which runs it before each test unit)
		@calculator = Calculator.new
		puts "I am in the before block!"
	end

	describe "#add method" do
		it "should return 0 when adding empty string" do
			expect(@calculator.add("")).to eq(0)
		end
		it "should return the number when adding one number" do
			expect(@calculator.add("5")).to eq(5)
		end
		it "should return the sum when adding two numbers" do
			expect(@calculator.add("2,78")).to eq(80)
		end
		it "should return the sum when adding multiple numbers" do
			expect(@calculator.add("8,7,6,5,4,3,2,1")).to eq(36)
		end
		it "should do the same when using a new line instead of ," do
			expect(@calculator.add("8\n7\n6\n5")).to eq(26)
		end
	end

	describe "#multiply method" do
		it "should return 0 when multiplying empty string" do
			expect(@calculator.multiply("")).to eq(0)
		end

		it "should return number when multiplying only one number" do
			expect(@calculator.multiply("5")).to eq(5)
		end

		it "should return product when multiplying multiple numbers" do
			expect(@calculator.multiply("2,3,4")).to eq(24)
		end

		it "should skip when 0 is part of the string" do
			expect(@calculator.multiply("1,2,0,6")).to eq(12)
		end
	end

	describe "#power method" do
		it "should return first to the power of second when putting two numbers" do
			expect(@calculator.power("2,3")).to eq(8)
		end

		it "should return first to the power of second to the power of third when putting three numbers" do
			expect(@calculator.power("2,3,4")).to eq(4096)
		end
	end
end