
class RobotCage
  def initialize(robots, referee)
    @referee = referee
    @first_robot = robots.first
    @second_robot = robots.last
  end

  def play_turn
    @first_robot.ask_attack
    @second_robot.ask_attack
    @referee.check_turn(@first_robot, @second_robot)
    if @referee.game_over?
      print_game_over
    else
      print_turn
      play_turn
    end
  end

  def print_game_over
    if @referee.champion.nil?
      puts "Game Over! You blew up!"
    else
      puts "Game Over"
      puts @referee.print_champion
    end
  end

  def print_turn
    @first_robot.print_situation(1)
    @second_robot.print_situation(2)
  end
end
