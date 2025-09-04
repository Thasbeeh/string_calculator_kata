# frozen_string_literal: true

# StringCalculator is a simple calculator that adds numbers provided in a string format.
class StringCalculator
  require 'pry'
  def self.add(input)
    if input.empty?
      0
    elsif input.start_with?('//')
      delimiter, numbers = extract_delimiter(input)
      numbers.split(delimiter).map(&:to_i).sum
    elsif !input.include?(',')
      input.to_i
    else
      input.gsub("\n", ',').split(',').map(&:to_i).sum
    end
  end

  def self.extract_delimiter(input)
    delimiter, numbers = input[2..].split("\n", 2)
    [Regexp.escape(delimiter), numbers]
  end
end
