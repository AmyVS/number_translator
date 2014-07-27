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
	# it('takes an integer with "0" as the last digit and does not return "zero"') do
	# 	expect(number_translator(20)).to(eq('twenty'))
	# end
	# it('takes an integer in between 20 and 99 and translates it into its respective words') do
	# 	expect(number_translator(21)).to(eq('twenty one'))
	# end

end