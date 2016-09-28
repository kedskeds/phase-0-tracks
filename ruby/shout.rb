module Shout
	#def self.yell_angrily(words)
	#	words + "!!!" + " :("
	#end
	#def self.yelling_happily(words)
	#	words + "!!! :)"
	#end

	def yell_angrily(words)
		words.upcase + "!!! :("
	end

	def yell_happily(words)
		words.capitalize + "!!! :)"
	end

end

#Shout.yell_angrily("I'm angry") 
#Shout.yelling_happily("I'm happy") 

class Student
	include Shout
end

class Teacher
	include Shout
end

new_student = Student.new 
p new_student.yell_angrily("what does this error message mean")

new_teacher = Teacher.new
p new_teacher.yell_happily("embrace confusion")
