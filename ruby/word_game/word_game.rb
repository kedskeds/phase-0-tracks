=begin 

WORD GUESSING GAME

- variables to initialize:
	- secret word (user input)
	- guesses made = empty array
	- guess limit = secret word length * 2
	- game over = false 
	- game won = false

- accept a guess from the user 
- IF not a repeated guess
	- add to guesses made array
	- IF guess exists in the secret word 
		-reveal letter

- check if game over OR game won
- IF guesses made length >= guess limit
	game over 
- IF secret word revealed
	game won

=end

class WordGame
	attr_reader :secret_word
	attr_accessor :guesses_made
	def initialize(secret_word)
		@secret_word = secret_word
		@guesses_made = []
		@guess_limit = @secret_word.length * 2
		@game_over = false
		@current_display = []

		@secret_word.split('').each do |letter|
			@current_display << "_"
		end
	end

	def repeat?(guess, guesses_made)
		if @guesses_made.join('').index(guess)
			true 
		else 
			false 
		end
	end

	def make_guess(guess, guesses_made)
		if !repeat?(guess, guesses_made)
			display(guess)
			@guesses_made << guess
		end
		@guesses_made
	end

	def display(guess)
		if @secret_word.index(guess)
			@current_display[@secret_word.index(guess)] = guess 
		end
		@current_display
	end

	def guess_limit_reached?
		if @guesses_made.length >= @guess_limit
			true 
		else 
			false
		end
	end
end

# driver code 

example_game = WordGame.new("secretword")

example_game.make_guess("e",example_game.guesses_made)
example_game.make_guess("f",example_game.guesses_made)
example_game.make_guess("w",example_game.guesses_made)
p example_game.guesses_made

