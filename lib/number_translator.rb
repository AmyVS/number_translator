def number_translator(input)
	single_digits = { 0 => "zero", 1 => "one", 2 => "two", 3 => "three", 4 => "four", 
									5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine" }
	teen_digits = { 0 => "ten", 1 => "eleven", 2 => "twelve", 3 => "thirteen", 
									4 => "fourteen", 5 => "fifteen", 6 => "sixteen", 7 => "seventeen", 
									8 => "eighteen", 9 => "nineteen" }
	tens_digits = { 2 => "twenty", 3 => "thirty", 4 => "forty", 5 => "fifty",
									6 => "sixty", 7 => "seventy", 8 => "eighty", 9 => "ninety" }

	# Final words are pushed here:
	words = []

 	# Breaking number up into hundreds
	big_number_prep = input.to_s.each_char.map { |digit| digit.to_i }
	big_number_prep2 = big_number_prep.reverse.each_slice(3).to_a.reverse

	big_number_final = []

	# Reversing number back into original order, while in an array
	position = 0
	while position < big_number_prep2.length do
		big_number_final << big_number_prep2[position].reverse
		position += 1
	end

	# For each hundred section in the number, analyse it and return the words for that section
	big_number_final.each do |hundred|

		# Remove "0"s in number, if they appear at the front of "hundred"
		if hundred[0] == 0 && hundred[1] == 0
			hundred = hundred.slice(2)
			number = hundred.to_i
		elsif (hundred[0] == 0) && (hundred[1] != 0)
			hundred = hundred.slice(1..2)
			number = hundred.join.to_i
		else
			number = hundred.join.to_i 
		end

		if number > 99 && number < 1000
			if hundred[0] != 0 && hundred[1] == 0 && hundred[2] == 0
				words << single_digits[hundred[0]] + " hundred"
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
	end

	result = words.join(",")
	result = result.sub(/[,]/, " thousand ")

	# Remove "zero" from the end if input is greater than 0
	if result.length > 4 && result.include?("zero")
		result =* result.split(" ")
		result.delete"zero"
		result = result.join(" ")
	end
	result
end

print number_translator(120000)