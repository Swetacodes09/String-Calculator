class StringCalculator
  def self.Add(numbers)
    return 0 if numbers.empty?

    delimiter = extract_delimiter(numbers)
    numbers = numbers.gsub(/^\/\/\[?.+?\]?$/, '')
    negatives = []
    
    sum = numbers.split(/#{delimiter.map { |d| Regexp.escape(d) }.join('|')}|\n/).inject(0) do |sum, num_str|
      num = num_str.to_i
      negatives << num if num.negative?
      num <= 1000 ? sum + num : sum
    end

    raise "negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?
    sum
  end

  private

  def self.extract_delimiter(numbers)
    delimiter_match = numbers.scan(/\[([^]]+)\]/).flatten
    delimiter_match.empty? ? [','] : delimiter_match.map { |d| d.gsub(/[\[\]]/, '') }
  end  
end
