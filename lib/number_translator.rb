def number_translator(number)
	single_digits = {0 => "zero", 1 => "one", 2 => "two", 3 => "three", 4 => "four", 
									5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine"}

	words = []

		if single_digits.has_key?(number)
			words << single_digits[number]

		end
	words.join("")
end

print number_translator(1)