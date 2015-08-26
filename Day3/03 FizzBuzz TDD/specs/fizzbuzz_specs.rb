Rrequire_relative '../lib/fizzbuzz'

RSpec.describe FizzBuzz do
  let(:game) {Fizzbuzz.new}

  describe "#game" do
    it "replaces all multiples of 3 with 'fizz'" do
      expect(game.run_game(3)).to eq("fizz")
    end
    it "replaces all multiples of 5 with 'buzz'" do
      expect(game.run_game(5)).to eq("buzz")
    end
    it "replaces all multiples of 3 and 5 with 'fizzbuzz'" do
      expect(game.run_game(15)).to eq("fizzbuzz")
    end
    it "puts the number in all other cases" do
      expect(game.run_game(47)).to eq(47)
    end
  end
end