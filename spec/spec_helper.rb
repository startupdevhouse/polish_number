require 'bundler/setup'
require 'polish_number'
require 'polish_number/classify_numbers'
require 'polish_number/process'
require 'polish_number/process_decimal_part'
require 'polish_number/process_integer_part'
require 'polish_number/process_number'
require 'polish_number/process_thousands'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
