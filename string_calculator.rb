# string_calculator.rb
class StringCalculator
    def self.add(numbers)
        return 0 if numbers.empty?

        delimiters = [",", "\n"]

        if numbers.start_with?("//")
            if numbers.start_with?("//[")
                delimiter_section = numbers[/\/\/\[(.+?)\]\n/, 1]
                delimiter = Regexp.escape(delimiter_section)
                numbers = numbers.split("\n", 2).last
                return numbers.split(/#{delimiter}|,|\n/).map(&:to_i).reject { |n| n > 1000 }.sum
            else
                delimiter, numbers = numbers.split("\n", 2)
                delimiter = delimiter[2]
                parts = numbers.split(/#{Regexp.escape(delimiter)}/)
            end
        else
            parts = numbers.split(/,|\n/)
        end

        nums = parts.map(&:to_i)
        negatives = nums.select { |n| n < 0 }

        raise "negative numbers not allowed #{negatives.join(',')}" unless negatives.empty?

        nums.reject { |n| n > 1000 }.sum
    end
end