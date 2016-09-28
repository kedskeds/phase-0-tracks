require_relative 'word_game'

describe WordGame do 
	let(:game) {WordGame.new("word")}
	it "checks for a repeated guess" do 
		guesses_made = game.make_guess("a",[])
		expect(game.repeat?("a", guesses_made)).to eq true
	end
	it "adds a guess to the list of guesses made" do 
		expect(game.make_guess("z",[])).to eq ["z"]
	end
	it "displays the current game state" do 
		game.make_guess("r",[])
		game.make_guess("a",["r"])
		expect(game.display).to eq (["_","_","r","_"])
	end
end