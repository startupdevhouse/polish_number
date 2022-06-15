module PolishNumber
  class ClassifyNumbers
    def initialize(digits)
      @digits = digits
    end

    def self.call(digits)
      new(digits).call
    end

    def call
      return :one if @digits.join.to_i == 1
      return :few if @digits && (2..4).cover?(@digits[-1]) && @digits[-2] != 1
      :many
    end
  end
end
