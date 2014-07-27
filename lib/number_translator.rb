def number_translator(input)
	single_digits = { 0 => "zero", 1 => "one", 2 => "two", 3 => "three", 4 => "four", 
									5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine" }
	teen_digits = { 10 => "ten", 11 => "eleven", 12 => "twelve", 13 => "thirteen", 14 => "fourteen", 
								15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 18 => "eighteen", 
								19 => "nineteen" }
	tens_digits = { 2 => "twenty", 3 => "thirty", 4 => "forty", 5 => "fifty",
								6 => "sixty", 7 => "seventy", 8 => "eighty", 9 => "ninety"}

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
			if teen_digits.has_key?(input)
				words << teen_digits[input]
			end
		elsif input > 19 && input < 100
			if tens_digits.has_key?(number_split[0]) && number_split[1] == 0
				words << tens_digits[number_split[0]]
			else
				words << tens_digits[number_split[0]] + " " + single_digits[number_split[1]]
			end
		else
			words << single_digits[number_split[0]] + " hundred " + tens_digits[number_split[1]] + " " + single_digits[number_split[2]]
		end
	words.join(" ")
end

print number_translator(123)