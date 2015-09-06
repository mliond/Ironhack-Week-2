require_relative '../lib/robots.rb'

RSpec.describe Robots do
	before :all do
		@robot = Robots.new(200)
	end

	describe "#describe_robot" do
		it "should initiate a robot with life points" do
			expect(@robot.life).to eq(200)
		end
	end
end

