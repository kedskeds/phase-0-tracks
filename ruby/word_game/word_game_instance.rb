require_relative 'word_game'
## Please see word_game.rb file for Class definition.

puts "Player 1: please enter a secret word."
secret_word = gets.chomp 
new_game = WordGame.new(secret_word)

puts "Player 2: You have #{new_game.guess_limit.to_i} guesses."

print new_game.current_display

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