# frozen_string_literal: true

require_relative './tax_bracket'

module IncomeTax
  class TaxTable
    attr_reader :tax_brackets, :annual_salary
    def initialize(annual_salary)
      @annual_salary = annual_salary
      @tax_brackets = [
        IncomeTax::TaxBracket.new(min: 0, max: 20000, rate: 0, max_income_tax: 0.0),
        IncomeTax::TaxBracket.new(min: 20001, max: 40000, rate: 0.1, max_income_tax: 2000.0),
        IncomeTax::TaxBracket.new(min: 40001, max: 80000, rate: 0.2, max_income_tax: 8000.0),
        IncomeTax::TaxBracket.new(min: 80001, max: 180000, rate: 0.3, max_income_tax: 30000.0),
        IncomeTax::TaxBracket.new(min: 180001, max: nil, rate: 0.4, max_income_tax: nil),
      ]
    end

    def compute_income_tax
      tax_brackets.select { |a| a.min <= @annual_salary }.inject(0.0) { |sum, bracket| sum + bracket.income_tax(@annual_salary)}
    end
  end
end
