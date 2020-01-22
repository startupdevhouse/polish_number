# frozen_string_literal: false
require "polish_number/version"
require "polish_number/process"

module PolishNumber
  def self.in_words(number)
    Process.in_words(number.round(2))
  end

  def self.with_currency(number)
    Process.with_currency(number.round(2))
  end
end
