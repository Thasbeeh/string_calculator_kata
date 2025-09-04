# frozen_string_literal: true

# StringCalculator is a simple calculator that adds numbers provided in a string format.
class StringCalculator
  def self.add(input)
    if input.empty?
      0
    elsif !input.include?(",")
      input.to_i
    else
      input.split(",").map(&:to_i).sum
    end
  end
end