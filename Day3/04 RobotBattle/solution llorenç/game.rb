require_relative "./robot.rb"
require_relative "./robot_cage.rb"
require_relative "./referee.rb"

class Game
  def initialize
    @cage = RobotCage.new([Robot.new("First Robot"), Robot.new("Second Robot")], Referee.new)
  end

  def run
    @cage.play_turn
  end
end

game = Game.new
game.run
