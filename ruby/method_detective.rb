# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.

puts "iNvEsTiGaTiOn".swapcase == "InVeStIgAtIoN"
# => “InVeStIgAtIoN”

puts "zom".insert(1,"o") == "zoom"
puts "zom".insert(-2,"o") == "zoom"
# => “zoom”

puts "enhance".center(8 + "enhance".length) == "    enhance    "
# => "    enhance    "

puts "Stop! You’re under arrest!".upcase == "STOP! YOU’RE UNDER ARREST!"
# => "STOP! YOU’RE UNDER ARREST!"

puts "the usual".insert(-1, " suspects") == "the usual suspects"
#=> "the usual suspects"

puts " suspects".insert(0, "the usual") == "the usual suspects"
# => "the usual suspects"

puts "The case of the disappearing last letter".chop == "The case of the disappearing last lette"
puts "The case of the disappearing last letter".chomp("r") == "The case of the disappearing last lette"
# => "The case of the disappearing last lette"

puts "The mystery of the missing first letter".delete("T") == "he mystery of the missing first letter"
# => "he mystery of the missing first letter"

puts "Elementary,    my   dear        Watson!".split.join(" ") == "Elementary, my dear Watson!"
# => "Elementary, my dear Watson!"

puts "z".ord == 122
puts "z".bytes[0] == 122
# => 122 
# (What is the significance of the number 122 in relation to the character z?)
# The number 122 represents the character "z". 
# This would be useful for creating an encryption method:
# instead of storing the alphabet in a string each time you're 
# working with individual characters, you could reference
# each letter of the alphabet by its equivalent char number.

puts "How many times does the letter 'a' appear in this string?".count("a") == 4
# => 4