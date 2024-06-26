require 'rails_helper'
require 'string_calc_logic' 

RSpec.describe StringCalcLogic, type: :service do
	describe '#add' do
		it 'returns 0 for an empty string' do
			expect(StringCalcLogic.add("")).to eq(0)
		end

		it 'returns sum for an string' do
			expect(StringCalcLogic.add("1")).to eq(1)
		end

		it 'returns sum for an string' do
			result = StringCalcLogic.add("0,3")
			expect(result).to eq(3)
		end

		it 'returns 6 for an string' do
			result = StringCalcLogic.add("1,3,2")
			expect(result).to eq(6)
		end

		it 'returns 13 for an empty string' do
			result = StringCalcLogic.add("2,4,2,5")
			expect(result).to eq(13)
		end

		it 'returns exception for negative numbers' do
			result = StringCalcLogic.add("-5,3,-1,-2")
			expect(result).to eq("negative numbers not allowed -5, -1, -2")
		end

		it 'returns 19 for an \n string' do
			result = StringCalcLogic.add('2\n4,5\n8')
			expect(result).to eq(19)
		end

		it 'returns sum of number for string' do
			result = StringCalcLogic.add('//;\n2;3;4')
			expect(result).to eq(9)
		end

		it 'returns invalid for an empty string' do
			result = StringCalcLogic.add('8,\n')
			expect(result).to eq('invalid')
		end

		it 'returns sum of and not include number >1000' do
			result = StringCalcLogic.add('2,1001')
			expect(result).to eq(2)
		end

		it 'returns sum for string contain *' do
			result = StringCalcLogic.add('/[***]\n1***2***3')
			expect(result).to eq(6)
		end

		it 'returns sum when string contain multiple delimiters' do
			result = StringCalcLogic.add('//[*][%]\n1*2%3')
			expect(result).to eq(6)
		end
	end
end
