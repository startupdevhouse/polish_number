require 'bigdecimal'
require 'bigdecimal/util'
require 'polish_number/process_integer_part'
require 'polish_number/process_decimal_part'
require 'polish_number/number_with_currency'

module PolishNumber
  class Process
    def initialize(number)
      @number = number.to_s.tr(',','.')
      unless (0..999_999).cover? BigDecimal.new(@number)
        fail 'Invalid range - (0 - 999_999)'
      end
    end

    def self.in_words(number)
      new(number).in_words
    end

    def self.with_currency(number)
      new(number).with_currency
    end

    def in_words
      [
        ProcessIntegerPart.call(integer_part),
        ProcessDecimalPart.call(decimal_part),
      ].join(' ').strip
    end

    def with_currency
      NumberWithCurrency.call(integer_part, decimal_part)
    end

    private

    def integer_part
      @integer_part ||= @number.to_i.to_s
    end

    def decimal_part
      ((BigDecimal.new(@number) - integer_part.to_i) * 100).round(2).to_i.to_s
    end
  end # class Process
end # module PolishNumber
