require_relative 'word_game'

describe WordGame do 
	let(:game) {WordGame.new("word")}
	it "checks for a repeated guess" do 
		guesses_made = game.make_guess("a")
		expect(game.repeat?("b", guesses_made)).to eq false
		expect(game.repeat?("a", guesses_made)).to eq true
	end
	it "adds a guess to the list of guesses made" do 
		expect(game.make_guess("z")).to eq ["z"]
		expect(game.make_guess("a")).to eq ["z","a"]
	end
	it "displays the current game state" do 
		game.make_guess("r")
		game.make_guess("a")
		expect(game.change_display("r")).to eq (["_","_","r","_"])
	end
	it "checks if too many guesses have been made" do 
		expect(game.guess_limit_reached?).to eq false
	end
	it "checks if the secret word has been revealed" do 
		game.make_guess("w")
		game.make_guess("o")
		expect(game.word_found?).to eq false
		game.make_guess("r")
		game.make_guess("d")
		expect(game.word_found?).to eq true
	end
	it "finds all occurences of a guess within the secret word" do 
		new_game = WordGame.new("hello")
		expect(new_game.find_index("l")).to eq [2,3]
	end
end