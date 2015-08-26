require_relative '../lib/cage.rb'

RSpec.describe Cage do
	before :all do
		@cage = Cage.new
	end

	describe "#show_cage" do
		it "should show a hash with the two fighters and their 200 initial life points" do
			expect(@cage.show_cage).to eq({fighterA: 200, fighterB: 200})
		end
	end
end

