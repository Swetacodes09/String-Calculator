require 'rails_helper'

RSpec.describe StringCalculator do
  describe '#Add' do
    context 'when given an empty string' do
      it 'returns 0' do
        expect(StringCalculator.Add("")).to eq(0)
      end
    end

    context 'when given a single number' do
      it 'returns the number' do
        expect(StringCalculator.Add("1")).to eq(1)
      end
    end   

    context 'when given two numbers separated by a comma' do
      it 'returns the sum of the two numbers' do
        expect(StringCalculator.Add("1,2")).to eq(3)
      end
    end
  
    context 'when given numbers separated by new lines and commas' do
      it 'returns the sum of all numbers' do
        expect(StringCalculator.Add("1\n2,3")).to eq(6)
      end
    end

    context 'when given a custom delimiter' do
      it 'returns the sum of numbers separated by the custom delimiter' do
        expect(StringCalculator.Add("//;\n1;2;3")).to eq(6)
      end
    end
  end
end
