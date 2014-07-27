def number_translator(input)
	single_digits = { 0 => "zero", 1 => "one", 2 => "two", 3 => "three", 4 => "four", 
									5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine" }
	teen_digits = { 0 => "ten", 1 => "eleven", 2 => "twelve", 3 => "thirteen", 
									4 => "fourteen", 5 => "fifteen", 6 => "sixteen", 7 => "seventeen", 
									8 => "eighteen", 9 => "nineteen" }
	tens_digits = { 2 => "twenty", 3 => "thirty", 4 => "forty", 5 => "fifty",
									6 => "sixty", 7 => "seventy", 8 => "eighty", 9 => "ninety" }

	number_split = []
	words = []

	input_array = input.to_s.split("")
	input_array.each do |digit|
		number_split << digit.to_i
	end

		if input < 10
			if single_digits.has_key?(input)
				words << single_digits[input]
			end
		elsif input >= 10 && input < 20
			if teen_digits.has_key?(number_split[1])
				words << teen_digits[number_split[1]]
			end
		elsif input > 19 && input < 100
			if tens_digits.has_key?(number_split[0]) && number_split[1] == 0
				words << tens_digits[number_split[0]]
			else
				words << tens_digits[number_split[0]] + " " + single_digits[number_split[1]]
			end
		elsif input > 99 && input < 1000
			if number_split[1] == 0 || number_split[1] == 1 
				words << single_digits[number_split[0]] + " hundred " + teen_digits[number_split[2]]
			else
				words << single_digits[number_split[0]] + " hundred " + tens_digits[number_split[1]] + " " + single_digits[number_split[2]]
			end
		end
	words.join(" ")
end

print number_translator(119)