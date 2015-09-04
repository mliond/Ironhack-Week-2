require_relative '../lib/lex'

RSpec.describe Lexiconomitron do
  before :each do
     @lexi = Lexiconomitron.new
  end

  describe "#eat_t" do
    it "removes every letter t from the input" do
      expect(@lexi.eat_t("great scott!")).to eq("grea sco!")
    end
    it "array: reverses the letters, and returns the first and last word (without t)" do
    	expect(@lexi.array_fun(["This", "is", "a", "boring", "test"])).to eq(["sih", "se"])
    end
    it "delete all words above 3 letters" do
    	expect(@lexi.oompa(["ift", "you", "wanna", "bet", "mty", "lover"])).to eq(["if", "you", "be", "my"])
    end

  end
end