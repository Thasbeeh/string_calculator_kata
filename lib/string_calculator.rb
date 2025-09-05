# frozen_string_literal: true

# StringCalculator is a simple calculator that adds numbers provided in a string format.
class StringCalculator
  require 'pry'

  def self.add(input)
    # Handle empty string
    return 0 unless input

    delimiters = /,|\n/
    # Check for custom delimiter in the header
    if input.start_with?('//')
      split_char, input = extract_delimiter(input)
      delimiters = Regexp.new("#{delimiters.source}|#{split_char}")
    end

    # Split the input string by the delimiters and convert to integers
    numbers = input.split(delimiters).map(&:to_i)

    # Check for negative numbers and raise an error if any are found
    negatives = numbers.select(&:negative?)
    raise("Negatives not allowed: #{negatives.join(', ')}") if negatives.any?

    numbers.sum
  end

  def self.extract_delimiter(input)
    header, numbers = input[2..].split("\n", 2)

    delimiters = if header.start_with?('[')
                   header.scan(/\[([^\]]+)\]/).flatten
                 else
                   [header]
                 end
    [delimiters.map { |d| Regexp.escape(d) }, numbers]
  end
end
