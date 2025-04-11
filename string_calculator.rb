# string_calculator.rb
class StringCalculator
    def self.add(numbers)
        return 0 if numbers.empty?

        return numbers.to_i if numbers.match?(/^\d+$/)
    end
end