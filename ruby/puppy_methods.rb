 class Puppy

   def fetch(toy)
     puts "I brought back the #{toy}!"
     toy
   end

   def speak(integer)
       integer.times do
           puts "Woof!"    
       end
   end

   def roll_over
       puts "*rolls over*"
   end
   
   def dog_years(integer)
       dog_age = integer*7
       puts "The dog is #{dog_age} years old!"
   end

   def shake_hand
       puts "Shake hand!"
   end

   def initialize
       puts "Initializing new puppy instance..."
   end

 end

# # driver code

# puppy = Puppy.new
# puppy.fetch("rubber ball")
# puppy.speak(3)
# puppy.roll_over
# puppy.dog_years(10)
# puppy.shake_hand

class Gymnast
    def initialize
        puts "Initializing gymnast..."
    end
    def flip
        puts "Flip!"
    end
    def jump(num)
        num.times do puts "Jump!" end
    end
    def split
        puts "Splits!"
    end
end

# Driver code

gymnasts = {}

50.times do |num| 
    gymnasts[num] = Gymnast.new
    gymnasts[num].flip
end


gymnasts.each do |key, value|
    value.jump(3)
end


