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

    context 'when given multiple numbers separated by commas' do
      it 'returns the sum of all numbers' do
        expect(StringCalculator.Add("1,2,3,4,5")).to eq(15)
      end
    end

    context 'when given negative numbers' do
      it 'throws an exception with the negative number' do
        expect { StringCalculator.Add("-1,2,-3") }.to raise_error("negatives not allowed: -1, -3")
      end
    end
  end
end
