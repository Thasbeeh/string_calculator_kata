# frozen_string_literal: true

# StringCalculator is a simple calculator that adds numbers provided in a string format.
class StringCalculator
  def self.add(input)
    0 if input.empty?
    input.to_i
  end
end
