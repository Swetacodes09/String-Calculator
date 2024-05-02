# app/models/string_calculator.rb

class StringCalculator
  def self.Add(numbers)
    delimiter = extract_delimiter(numbers)
    numbers = numbers.split(/#{delimiter}/).last if delimiter.present?

    negatives = []
    sum = numbers.split(/[\n,]/).inject(0) do |sum, num_str|
      num = num_str.to_i
      negatives << num if num.negative?
      num <= 1000 ? sum + num : sum
    end

    raise "negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?
    sum
  end

  private

  def self.extract_delimiter(numbers)
    delimiter_match = numbers.match(/^\/\/\[?(.+?)\]?$/)
    delimiter_match ? Regexp.escape(delimiter_match[1]) : ','
  end
end
