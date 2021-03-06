require('rspec')
require('number_translator')

describe('number_translator') do
	it('takes an integer and translates it into its respective word or words') do
		expect(number_translator(1)).to(eq('one'))
	end
	it('takes an integer in between 11 and 19 and translates it into its respective word') do
		expect(number_translator(11)).to(eq('eleven'))
	end
	it('takes the integer "0" and returns "zero"') do
		expect(number_translator(0)).to(eq('zero'))
	end
	it('takes an integer with "0" as the last digit and returns its respective word(s), sans "zero"') do
		expect(number_translator(20)).to(eq('twenty'))
	end
	it('takes an integer in between 20 and 99 and translates it into its respective words') do
		expect(number_translator(21)).to(eq('twenty one'))
	end
	it('takes an integer with a "0" in the tens place and returns the proper words') do
		expect(number_translator(102)).to(eq('one hundred two'))
	end
	it('takes an integer in the hundreds and translates it into its respective words') do
		expect(number_translator(123)).to(eq('one hundred twenty three'))
	end
	it('takes an integer in the hundreds with smaller digits in the teens and translates it into its respective words') do
		expect(number_translator(113)).to(eq('one hundred thirteen'))
	end
	it('takes an integer in between 1,000 and 999,999 translates it into its respective words') do
		expect(number_translator(1234)).to(eq('one thousand two hundred thirty four'))
	end
	it('takes an integer that ends in "0"s and translates it into its respective words') do
		expect(number_translator(100)).to(eq('one hundred'))
	end
	it('takes an integer that has a "0" in the hundredths place and translates it into its respective words') do
		expect(number_translator(1034)).to(eq('one thousand thirty four'))
	end
	it('takes an integer that has a "0" in the hundredths and tenths place and translates it into its respective words') do
		expect(number_translator(1004)).to(eq('one thousand four'))
	end
	it('takes an integer that contains three "0"s in the hundreds section and translates it into its respective words') do
		expect(number_translator(1000)).to(eq('one thousand'))
	end
	it('takes an integer that might give a "zero" output and returns it sans "zero"') do
		expect(number_translator(120000)).to(eq('one hundred twenty thousand'))
	end
	it('takes the integer in the millions and translates it into its respective words') do
		expect(number_translator(1_001_001)).to(eq('one million one thousand one'))
	end
	it('takes the integer in the billions and translates it into its respective words') do
		expect(number_translator(1_020_010_001)).to(eq('one billion twenty million ten thousand one'))
	end
	it('takes the integer in the trillions and translates it into its respective words') do
		expect(number_translator(1_020_010_001_123)).to(eq('one trillion twenty billion ten million one thousand one hundred twenty three'))
	end
	it('takes an even power of ten integer and translates it into its respective words') do
		expect(number_translator(1_000_000_000_000)).to(eq('one trillion'))
	end
end