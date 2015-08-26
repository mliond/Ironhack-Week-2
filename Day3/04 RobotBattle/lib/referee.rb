require_relative './cage.rb'

class Referee
	attr_accessor :move_hash, :cage

	def initialize
		@move_hash = {weak: 10, strong: 20, definitive: 50}
		@cage = Cage.new.show_cage
	end

	def start_game
		puts "Currently the status is #{tell_results}"
		attack_a = get_input("A")
		attack_b = get_input("B")
		puts evaluate_command_array(attack_a, attack_b)
		start_game
	end

	def get_input(letter)
		puts "Please enter the command for Fighter #{letter}:"
		input = gets.chomp.downcase.to_sym
			if @move_hash.keys.include? (input)
				return input
			else
				puts "Please enter a valid command."
				get_input(letter)
			end
	end

	def evaluate_command_array(attack_a, attack_b)
		# aIf both select to attack with the weak attack, the damage for both is gonna be null.
		if attack_a == :weak && attack_b == :weak
			attack_points_a = 0
			attack_points_b = 0
		# If both select strong attack, the damage is gonna be double!
		elsif attack_a == :strong && attack_b == :strong
			attack_points_a = @move_hash[:strong] * 2
			attack_points_b = @move_hash[:strong] * 2
		# If they decide to attack with the definitive attack, the scenario will blow up and both lose.
		elsif attack_a == :definitive && attack_b == :definitive
			attack_points_a = 200
			attack_points_b = 200
		# If one choose the definitive and the other choose the weak one, it only applies the weak damage and the definitive is gonna be null damage.
		elsif attack_a == :definitive && attack_b == :weak
			attack_points_a = 0
			attack_points_b = @move_hash[:weak]
		elsif attack_a == :weak && attack_b == :definitive
			attack_points_a = @move_hash[:weak]
			attack_points_b = 0
		# regular attack
		else
			attack_points_a = @move_hash[attack_a]
			attack_points_b = @move_hash[attack_b]
		end

		reduce_points(attack_points_a, attack_points_b)
	end

	def reduce_points(attack_points_a, attack_points_b)
		@cage[:fighterA] = @cage[:fighterA] - attack_points_b
		@cage[:fighterB] = @cage[:fighterB] - attack_points_a

		if @cage[:fighterA] <= 0 && @cage[:fighterB] <= 0
			puts "Both Fighters exploded. What a crazy game!"
			exit
		elsif @cage[:fighterA] <= 0
			puts "Fighter B won gloriously."
			exit
		elsif @cage[:fighterB] <= 0
			puts "Fighter A is the king of all robots."
			exit
		end

		tell_results
	end

	def tell_results
		@cage
	end
end