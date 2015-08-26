require_relative '../lib/referee.rb'

RSpec.describe Referee do
	before :each do
		@referee = Referee.new
	end

	describe "#evaluate_moves" do
		it "should show a hash of three possible moves" do
			expect(@referee.move_hash).to eq({weak: 10, strong: 20, definitive: 50})
		end

		it "should have access to the Cage class' fighter hash" do
			expect(@referee.cage).to eq({fighterA: 200, fighterB: 200})
		end

		it "should evaluate the damage of a weak attack of A and a strong of B" do
			expect(@referee.evaluate_command_array(:weak, :strong)).to eq({fighterA: 180, fighterB: 190})
		end

		it "both weak -> no damage" do
			expect(@referee.evaluate_command_array(:weak, :weak)).to eq({fighterA: 200, fighterB: 200})
		end

		it "both strong -> double damage" do
			expect(@referee.evaluate_command_array(:strong, :strong)).to eq({fighterA: 160, fighterB: 160})
		end

		it "both definitive -> both lose" do
			expect(@referee.evaluate_command_array(:definitive, :definitive)).to eq("Both Fighters exploded. What a crazy game!")
		end

		it "A definitive, B weak -> only B weak" do
			expect(@referee.evaluate_command_array(:definitive, :weak)).to eq({fighterA: 190, fighterB: 200})
		end

		it "A weak, B definitive -> only A weak" do
			expect(@referee.evaluate_command_array(:weak, :definitive)).to eq({fighterA: 200, fighterB: 190})
		end

		it "Player B loses" do
			expect(@referee.reduce_points(0, 200)).to eq("Fighter B won gloriously.")
		end

		it "Player A loses" do
			expect(@referee.reduce_points(200, 0)).to eq("Fighter A is the king of all robots.")
		end
	end
end