require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  describe ".add" do
    it "returns 0 for an empty string" do
      expect(StringCalculator.add("")).to eq(0)
    end

    it "returns the number for a single number" do
      expect(StringCalculator.add("1")).to eq(1)
      expect(StringCalculator.add("2")).to eq(2)
    end

    it "returns the sum for two numbers" do
      expect(StringCalculator.add("1,2")).to eq(3)
      expect(StringCalculator.add("10,20")).to eq(30)
    end

    it "returns the sum for n numbers" do
      expect(StringCalculator.add("7,8,9")).to eq(24)
      expect(StringCalculator.add("10,20,30,40")).to eq(100)
      expect(StringCalculator.add("1,2,3,  4,5,6,7")).not_to eq(1)
    end

    it "handles new lines between numbers" do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
      expect(StringCalculator.add("10\n20\n30,40")).to eq(100)
    end

    it "handles custom delimiters in headers" do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end

    it "raises an error for negative numbers" do
      expect { StringCalculator.add("-1") }.to raise_error("Negatives not allowed: -1")
      expect { StringCalculator.add("1,-2,3") }.to raise_error("Negatives not allowed: -2")
      expect { StringCalculator.add("-1,-2,3") }.to raise_error("Negatives not allowed: -1, -2")
    end

    it "handle delimiter of any length" do
      expect(StringCalculator.add("//[***]\n1***2***3")).to eq(6)
      expect(StringCalculator.add("//[;;;;]\n10;;;;20;;;;30")).to eq(60)
    end
  end
end
