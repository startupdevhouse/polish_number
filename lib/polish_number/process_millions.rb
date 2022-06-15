require 'polish_number/classify_numbers'

module PolishNumber
  class ProcessMillions
    MILLIONS = { one: 'milion', few: 'miliony', many: 'milionów' }.freeze

    def initialize(number, digits)
      @number = number
      @digits = digits
    end

    def self.call(number, digits)
      new(number, digits).call
    end

    def call
      value = @number.to_i / 1_000_000
      return '' unless value > 0
      MILLIONS[ClassifyNumbers.call(@digits)]
    end
  end
end
