require 'polish_number/classify_numbers'
require 'polish_number/process_decimal_part'
require 'polish_number/process_integer_part'

module PolishNumber
  class NumberWithCurrency
    def initialize(integer, decimal)
      @integer = integer
      @decimal = decimal
    end

    def self.call(integer, decimal)
      new(integer, decimal).call
    end

    def call
      [@integer, classify_integer_part,
       @decimal, classify_decimal_part].join(' ')
    end

    private

    def classify_decimal_part
      ProcessDecimalPart::CURRENCIES[
        ClassifyNumbers.call(@decimal, decimal_digits)]
    end

    def classify_integer_part
      ProcessIntegerPart::CURRENCIES[
        ClassifyNumbers.call(@integer, integer_digits)]
    end

    def decimal_digits
      @decimal_digits ||= @decimal.rjust(3, '0').chars.map(&:to_i)
    end

    def integer_digits
      @integer_digits ||= @integer.rjust(6, '0').chars.map(&:to_i)
    end
  end
end # module PolishNumber
