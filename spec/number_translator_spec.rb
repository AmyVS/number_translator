require('rspec')
require('number_translator')

describe('number_translator') do
	it('takes an integer and translates it into its respective words') do
		expect(number_translator(1)).to(eq('one'))
	end
end