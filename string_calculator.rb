# string_calculator.rb
class StringCalculator
    def self.add(numbers)
        return 0 if numbers.empty?
        
        delimiters = [",", "\n"]
        
        if numbers.start_with?("//")
            if numbers.start_with?("//[")
                delimiter_matches = numbers.scan(/\[([^\]]+)\]/).flatten
                delimiters_regex = delimiter_matches.map { |d| Regexp.escape(d) }.join("|")
                numbers = numbers.split("\n", 2).last
                return numbers.split(/#{delimiters_regex}|,|\n/).map(&:to_i).reject { |n| n > 1000 }.sum
            else
                delimiter, numbers = numbers.split("\n", 2)
                delimiter = delimiter[2]
                parts = numbers.split(/#{Regexp.escape(delimiter)}/)
            end
        else
            parts = numbers.split(/,|\n/).map(&:to_i).reject { |n| n > 1000 }
        end
        
        nums = parts.map(&:to_i)
        negatives = nums.select { |n| n < 0 }
        
        raise "negative numbers not allowed #{negatives.join(',')}" unless negatives.empty?
        
        nums.sum
    end
end