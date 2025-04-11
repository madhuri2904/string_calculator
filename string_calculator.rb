# string_calculator.rb
class StringCalculator
    def self.add(numbers)
        return 0 if numbers.empty?

        if numbers.start_with?("//")
            delimiter, numbers = numbers.split("\n", 2)
            delimiter = delimiter[2]
            parts = numbers.split(/#{Regexp.escape(delimiter)}/)
        else
            parts = numbers.split(/,|\n/)
        end

        nums = parts.map(&:to_i)
        negatives = nums.select { |n| n < 0 }

        raise "negative numbers not allowed #{negatives.join(',')}" unless negatives.empty?

        nums.sum
    end
end