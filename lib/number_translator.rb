def number_translator(number)
	single_digits = {0 => "zero", 1 => "one", 2 => "two", 3 => "three", 4 => "four", 
									5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine"}
	teen_digits = {10 => "ten", 11 => "eleven", 12 => "twelve", 13 => "thirteen", 14 => "fourteen", 
								15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 18 => "eighteen", 19 => "nineteen"}

	words = []

		if number < 10
			if single_digits.has_key?(number)
				words << single_digits[number]
			end
		elsif number >= 10 && number < 20
			if teen_digits.has_key?(number)
				words << teen_digits[number]
			end
		end

	words.join("")
end

print number_translator(11)