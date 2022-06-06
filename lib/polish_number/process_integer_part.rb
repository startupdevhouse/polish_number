require 'polish_number/process_number'
require 'polish_number/process_thousands'
require 'polish_number/process_millions'
require 'polish_number/classify_numbers'

module PolishNumber
  class ProcessIntegerPart
    CURRENCIES = { one: 'złoty', few: 'złote', many: 'złotych' }.freeze

    def initialize(number)
      @number = number
    end

    def self.call(number)
      new(number).call
    end

    def call
      return 'zero złotych' if @number == '0'

      [over_or_equal_million, over_or_equal_thousand, less_than_thousand].join(' ').squeeze
    end

    private

    def over_or_equal_million
      scope = digits[0..2]
      [ProcessNumber.call(scope), ProcessMillions.call(@number, scope)].join
    end

    def over_or_equal_thousand
      scope = digits[3..5]
      [ProcessNumber.call(scope), ProcessThousands.call(@number, scope)].join
    end

    def less_than_thousand
      [
        ProcessNumber.call(digits[6..9]),
        CURRENCIES[ClassifyNumbers.call(digits[6..9])]
      ].join
    end

    def digits
      @digits ||= @number.rjust(9, '0').chars.map(&:to_i)
    end
  end
end
