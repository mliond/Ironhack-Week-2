require_relative "./attack.rb"
require "io/console"

class Robot
  attr_reader :name

  def initialize(name)
    @name = name
    @health_points = 200
    @attacks = []
    set_attacks
  end

  def ask_attack
    puts "#{@name}, select attack: (w, s d)"
    print "> "
    attack_string = STDIN.noecho(&:gets).chomp
    puts ""
    @current_attack = @attacks.select do |attack|
      attack.name[0] == attack_string
    end.first
  end

  def current_attack
    @current_attack.name
  end

  def current_attack_damage
    @current_attack.damage
  end

  def dead?
    @health_points <= 0
  end

  def print_situation(position)
    puts "#{@name} has #{@health_points} left"
  end

  def receive_damage(damage)
    @health_points -= damage
  end

  def set_attacks
    @attacks << Attack.new(:weak, 10)
    @attacks << Attack.new(:strong, 20)
    @attacks << Attack.new(:definitive, 50)
  end
end
