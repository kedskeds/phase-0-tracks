module Shout
	def self.yell_angrily(words)
		words + "!!!" + " :("
	end
	def self.yelling_happily(words)
		words + "!!! :)"
	end
end

Shout.yell_angrily("I'm angry") # => I'm angry!!! :(
Shout.yelling_happily("I'm happy") # => I'm happy!!! :)