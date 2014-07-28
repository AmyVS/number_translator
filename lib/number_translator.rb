def number_translator(input)
	single_digits = { 0 => "zero", 1 => "one", 2 => "two", 3 => "three", 4 => "four", 
			  5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine" }

	teen_digits = { 0 => "ten", 1 => "eleven", 2 => "twelve", 3 => "thirteen", 
			4 => "fourteen", 5 => "fifteen", 6 => "sixteen", 7 => "seventeen", 
			8 => "eighteen", 9 => "nineteen" }

	tens_digits = { 2 => "twenty", 3 => "thirty", 4 => "forty", 5 => "fifty",
			6 => "sixty", 7 => "seventy", 8 => "eighty", 9 => "ninety" }

	nth_digits =  { 1 => " thousand ", 2 => " million ", 3 => " billion ", 
			4 => " trillion " } 

	# Final words are pushed here:
	words = []
	result = ""

	####### Processing input before running it through the "hundred" analyser #######

 	# Breaking number up into hundreds
	big_number_prep = input.to_s.each_char.map { |digit| digit.to_i }
	big_number_prep2 = big_number_prep.reverse.each_slice(3).to_a.reverse

	big_number_final = []

	# Reversing number back into original order and pushing into final array for analysis
	position = 0
	while position < big_number_prep2.length do
		big_number_final << big_number_prep2[position].reverse
		position += 1
	end

	####### Removing unnecessary nth-power-ofs off the end of the array #######

		# Trillions
	if ((input >= 10 ** 12) && (input < 10 ** 15)) && ((big_number_final[1] == [0,0,0]) && (big_number_final[2] == [0,0,0]) && (big_number_final[3] == [0,0,0]) && (big_number_final[4] == [0,0,0]))
		big_number_final.pop(3)
		# Billions
	elsif ((input >= 10 ** 9) && (input < 10 ** 12)) && ((big_number_final[1] == [0,0,0]) && (big_number_final[2] == [0,0,0]) && (big_number_final[3] == [0,0,0]))
		big_number_final.pop(2)
		# Millions
	elsif ((input >= 10 ** 6) && (input < 10 ** 9)) && ((big_number_final[1] == [0,0,0]) && (big_number_final[2] == [0,0,0]))
		big_number_final.pop(1)
	else
		big_number_final
	end


	# For each "hundred" section in the number, analyse it and return the words for that section
	big_number_final.each do |hundred|
		# Remove "0"s in number, if they appear at the front of "hundred" section
		if hundred[0] == 0 && hundred[1] == 0
			hundred = hundred.slice(2)
			number = hundred.to_i
		elsif (hundred[0] == 0) && (hundred[1] != 0)
			hundred = hundred.slice(1..2)
			number = hundred.join.to_i
		else
			number = hundred.join.to_i 
		end

		####### Hundred's analyser #######
		if number > 99 
			if hundred[0] != 0 && hundred[1] == 0 && hundred[2] == 0
				words << single_digits[hundred[0]] + " hundred"
			elsif hundred[0] != 0 && hundred[1] == 0 && hundred[2] !=0
				words << single_digits[hundred[0]] + " hundred " + single_digits[hundred[2]] 
			elsif hundred[1] == 0 || hundred[1] == 1 
				words << single_digits[hundred[0]] + " hundred " + teen_digits[hundred[2]]
			else
				words << single_digits[hundred[0]] + " hundred " + tens_digits[hundred[1]] + " " + single_digits[hundred[2]]
			end	
		elsif number > 19 && number < 100
			if tens_digits.has_key?(hundred[0]) && hundred[1] == 0
				words << tens_digits[hundred[0]]
			else
				words << tens_digits[hundred[0]] + " " + single_digits[hundred[1]]
			end
		elsif number >= 10 && number < 20
			words << teen_digits[hundred[1]]
		else 
			words << single_digits[number]
		end
		words.join(" ")

		####### Include nth-power words here #######
		result = words.join(",")
			# Trillions
		if result.include?(",") && ((input >= 10 ** 12) && (input < 10 ** 15))
			nth = 4
			until nth == 0 do
				result = result.sub(/[,]/, nth_digits[nth])
				nth -= 1
			end
			# Billions
		elsif result.include?(",") && ((input >= 10 ** 9) && (input < 10 ** 12))
			nth = 3
			until nth == 0 do
				result = result.sub(/[,]/, nth_digits[nth])
				nth -= 1
			end
			# Millions
		elsif result.include?(",") && ((input >= 10 ** 6) && (input < 10 ** 9))
			nth = 2
			until nth == 0 do
				result = result.sub(/[,]/, nth_digits[nth])
				nth -= 1
			end
			# Thousands
		elsif result.include?(",") && ((input >= 10 ** 3) && (input < 10 ** 6))
			result = result.sub!(/[,]/, nth_digits[1])
		else
			nil
		end
	end

	####### Remove unnecessary "zero"s from result, if input is greater than 0 #######
	if result.length > 4 && result.include?("zero")
		result =* result.split(" ")
		result.delete"zero"
		result = result.join(" ")
	end
	result
end
