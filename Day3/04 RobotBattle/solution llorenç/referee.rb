class Referee
  attr_reader :champion

  def initialize
    @game_over = false
    @champion = nil
  end

  def apply_damages(first_robot, second_robot)
    first_robot.receive_damage(@current_damages[1])
    second_robot.receive_damage(@current_damages[0])
  end

  def both_definitive_attacks?(attacks)
    attacks[0] == attacks[1] && attacks[0] == :definitive
  end

  def both_strong_attacks?(attacks)
    attacks[0] == attacks[1] && attacks[0] == :strong
  end

  def both_weak_attack?(attacks)
    attacks[0] == attacks[1] && attacks[0] == :weak
  end

  def check_attacks(first_robot, second_robot)
    @current_damages = [first_robot.current_attack_damage, second_robot.current_attack_damage]
    attacks = [first_robot.current_attack, second_robot.current_attack]
    check_weak_attacks(attacks)
    check_strong_attacks(attacks)
    check_definitive_attacks(attacks)
    check_weak_and_definitive(attacks)
    apply_damages(first_robot, second_robot)
    update_game_over(first_robot, second_robot)
  end

  def check_turn(first_robot, second_robot)
    check_attacks(first_robot, second_robot)
  end

  def check_definitive_attacks(attacks)
    @game_over = true if both_definitive_attacks?(attacks)
  end

  def check_strong_attacks(attacks)
    if both_strong_attacks?(attacks)
      @current_damages = [@current_damages[0] * 2, @current_damages[1] * 2]
    end
  end

  def check_weak_and_definitive(attacks)
    @current_damages = [10, 0] if (attacks[0] == :weak && attacks[1] == :definitive)
    @current_damages = [0, 10] if (attacks[0] == :definitive && attacks[1] == :weak)
  end

  def check_weak_attacks(attacks)
    @current_damages = [0, 0] if both_weak_attack?(attacks)
  end

  def game_over?
    @game_over
  end

  def print_champion
    puts "#{@champion.name} won the battle!!"
  end

  def update_game_over(first_robot, second_robot)
    if first_robot.dead?
      @game_over = true
      @champion = second_robot
    elsif second_robot.dead?
      @game_over = true
      @champion = first_robot
    end
  end
end
