

# OUR METHOD DECLARATIONS

# encrypt takes in a string and loops through the string and for each character in the string we add one to the index and at the end we return the encrypted string.
def encrypt(str)
  len=str.length
  i = 0
  #declare empty string
  answer=""
  #loop to go over each character in the string
  while i <  len
    if str[i]=="z"
      answer=answer+"a"
    else
      answer= answer+str[i].next
    end
    i+=1
  end
  return answer
end

# p encrypt("hello")

# decrypt takes in a string and returns a reverse of the encrypt method. It goes one letter backwards.
def decrypt(str)
  letters= "abcdefghijklmnopqrstuvwxyz"
  len=str.length
  i =0
  #declare empty string
  answer=""
  #compares each string character to the "letters" variable
  while i<len
    a = letters.index(str[i])
    if a ==0
      a==26
    end
    answer = answer+letters[a-1]
    i+=1
  end
  return answer
end

# OUR TESTS
# p decrypt("hello")
#p encrypt("abc")
#p encrypt("zed")
#p decrypt("bcd")
#p decrypt("afe")

# decrypt(encrypt("swordfish"))

# Ruby evaluates the inner method first, so Ruby encrypts
# the string "swordfish". Then, decrypt is given the
# encryped form of "swordfish" as an argument. It returns the
# decrypted version.

#Ask the user if they want to decrypt or encrypt
def ask
  puts "Would you like to decrypt or encrypt a password?"
  answer = gets.chomp
  # ask for the password
  puts "What is the password? (only lowercase letters)"
  password = gets.chomp
  # return the desired method call
  if answer == "decrypt"
    return decrypt(password)
  else 
    return encrypt(password)
  end
end 

# print the method to the console
p ask 