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
	attr_reader :secret_word, :current_display, :guess_limit
	attr_accessor :guesses_made
	def initialize(secret_word)
		@secret_word = secret_word.downcase
		@guesses_made = []
		@guess_limit = @secret_word.length * 1.5
		@indexes = [] 

		@game_lose = false
		@game_win = false

		@current_display = @secret_word.gsub(/./,"_").split('')

	end

	def repeat?(guess, guesses_made)
		if @guesses_made.join('').index(guess)
			true 
		else 
			false 
		end
	end

	def make_guess(guess)
		if !repeat?(guess, guesses_made)
			change_display(guess)
			@guesses_made << guess
		end
		@guesses_made
	end

	def find_index(guess)
		counter = 0
		@indexes = []
		@secret_word.split('').each do |letter|
			if letter == guess 
				@indexes << counter 
			end
			counter += 1
		end
		@indexes
	end

	def change_display(guess)
		if @secret_word.index(guess)

			find_index(guess).each do |index|
				@current_display[index] = guess
			end

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

	def word_found?
		if @current_display.join('') == @secret_word
			true
		else
			false
		end
	end
end

# driver code 
=begin
puts "Player 1: please enter a secret word."
secret_word = gets.chomp 
new_game = WordGame.new(secret_word)

puts "Player 2: You have #{new_game.guess_limit.to_i} guesses."

p new_game.current_display

puts "Please enter a guess:"
until new_game.word_found? || new_game.guess_limit_reached?
	
	guess = gets.chomp.downcase 
	new_game.make_guess(guess)

	p new_game.current_display

end 

if new_game.word_found?
	puts "Congratulations! You won in #{new_game.guesses_made.length} guesses."
else 
	puts "YOU LOSE! The secret word was #{new_game.secret_word}."
end
=end