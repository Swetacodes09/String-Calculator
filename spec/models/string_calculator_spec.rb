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
  
   
  end
end
