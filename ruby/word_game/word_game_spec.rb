require_relative 'word_game'

describe WordGame do 
	let(:game) {WordGame.new}
	it "checks for a repeated guess" do 
		expect(game.repeat?("a",["a","b"])).to eq true
	end
end