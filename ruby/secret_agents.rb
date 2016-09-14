# encrypt takes in a string and loops through the string and for each character in the string we add one to the index and at the end we return the encrypted string.
def encrypt(str)
  len=str.length
  i = 0
  answer=""
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

def decrypt(str)
  letters= "abcdefghijklmnopqrstuvwxyz"
  len=str.length
  i =0
  answer=""
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
# p decrypt("hello")
p encrypt("abc")
p encrypt("zed")
p decrypt("bcd")
p decrypt("afe")
