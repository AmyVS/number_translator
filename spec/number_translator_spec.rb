require('rspec')
require('number_translator')

describe('number_translator') do
	it('takes an integer and translates it into its respective words') do
		expect(number_translator(1)).to(eq('one'))
	end
	it('takes an integer in between 10 and 19 and translates it into its respective words') do
		expect(number_translator(11)).to(eq('eleven'))
	end
end