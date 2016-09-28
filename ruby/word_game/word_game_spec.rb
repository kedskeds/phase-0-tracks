require_relative 'word_game'

describe WordGame do 
	let(:game) {WordGame.new("word")}
	it "checks for a repeated guess" do 
		guesses_made = game.make_guess("a",[])
		expect(game.repeat?("b", guesses_made)).to eq false
	end
	it "adds a guess to the list of guesses made" do 
		expect(game.make_guess("z",[])).to eq ["z"]
	end
	it "displays the current game state" do 
		game.make_guess("r",[])
		game.make_guess("a",["r"])
		expect(game.display("r")).to eq (["_","_","r","_"])
	end
	it "checks if too many guesses have been made" do 
		expect(game.guess_limit_reached?).to eq false
	end
	it "checks if the secret word has been revealed" do 
		game.make_guess("w",[])
		game.make_guess("o",["w"])
		game.make_guess("r",["w","o"])
		game.make_guess("d",["w","o","r"])
		expect(game.word_found?).to eq false
	end
end