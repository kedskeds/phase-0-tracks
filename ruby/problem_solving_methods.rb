#Release 0 search 

def search_array (arr, number)

	count=0
	arr.each do |integer|
		if integer == number 
			break
		end
		count += 1

	end 
 return count
end 
new_arr = [1,2,3,4,5]
p search_array(new_arr, 4)


#Release 1 calculate Fibonacci Numbers

def fib(num)
	arr = [0,1]
	if num == 0
		arr = [0]
	elsif num == 1
		arr = [0,1]
	else
		counter = 2
		while counter < num 
			arr[counter]= arr[counter - 2] + arr[counter - 1]
			counter += 1
		end
	end
	return arr
end

p fib(100)[-1] == 218922995834555169026

# Release 2 research on sorting algorithm 

=begin

BUBBLE SORT 

-bubble_sort takes an array as a parameter
-loop through the array
	-if the first item is larger than the second,
			-swap the order of the elements in the array
-continue looping until the array is sorted.

	
=end


def bubble_sort(arr)
	n = arr.length 
	loop do 
		swapped = false 
		i = 1 
	
		for i in 1...n
			if arr[i-1] > arr[i]
				smaller_num = arr[i]
				arr[i] = arr[i-1]
				arr[i-1] = smaller_num
				p arr
				swapped = true
			end
		end
		break if not swapped 
	end
	arr
	
end

p bubble_sort([5, 4, 3, 2, 1, 54, 6])