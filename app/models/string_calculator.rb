class StringCalculator
  def self.Add(numbers)
    return 0 if numbers.empty?

    delimiter = extract_delimiter(numbers)
    numbers = numbers.gsub(/^\/\/\[?.+?\]?$/, '')
    negatives = []
    sum = numbers.split(/#{delimiter}|\n/).inject(0) do |sum, num_str|
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
