require 'polish_number/version'
require 'polish_number/process'

module PolishNumber
  def self.in_words(number)
    Process.in_words(number.to_f.round(2))
  end

  def self.with_currency(number)
    Process.with_currency(number.to_f.round(2))
  end

  def self.with_short_currency(number)
    Process.with_short_currency(number.to_f.round(2))
  end
end
