require 'bigdecimal'
require 'bigdecimal/util'
require 'polish_number/process_integer_part'
require 'polish_number/process_decimal_part'
require 'polish_number/number_with_currency'

module PolishNumber
  class Process
    def initialize(number)
      @number = number.to_s.tr(',', '.')
      raise 'Invalid range - (0 - 999_999_999)' unless (0..999_999_999.99).cover? BigDecimal(@number)
    end

    def self.in_words(number)
      new(number).in_words
    end

    def self.with_currency(number)
      new(number).with_currency
    end

    def self.with_short_currency(number)
      new(number).with_short_currency
    end

    def in_words
      [
        ProcessIntegerPart.call(integer_part),
        ProcessDecimalPart.call(decimal_part)
      ].join(' ').strip
    end

    def with_currency
      NumberWithCurrency.call(integer_part, decimal_part)
    end

    def with_short_currency
      NumberWithCurrency.call(integer_part, decimal_part, true)
    end

    private

    def integer_part
      @integer_part ||= @number.to_i.to_s
    end

    def decimal_part
      ((BigDecimal(@number) - integer_part.to_i) * 100).round(2).to_i.to_s
    end
  end
end
