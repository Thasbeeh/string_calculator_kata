# frozen_string_literal: true

# StringCalculator is a simple calculator that adds numbers provided in a string format.
class StringCalculator
  require 'pry'
  def self.add(input)
    if input.empty?
      0
    elsif input.start_with?("//")
      delimiter, numbers = input[2..].split("\n", 2)
      delimiter = Regexp.escape(delimiter)
      numbers.split(delimiter).map(&:to_i).sum
    elsif !input.include?(",")
      input.to_i
    else
      input.gsub("\n", ",").split(",").map(&:to_i).sum
    end
  end
end