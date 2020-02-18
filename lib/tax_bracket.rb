module IncomeTax
  class TaxBracket
    MINIMUM_OPERAND_OFFSET = -1

    attr_reader :min, :max, :rate, :max_income_tax

    def initialize(min: 0, max: 0, rate: 0, max_income_tax: 0)
      @min = min
      @max = max
      @rate = rate
      @max_income_tax = max_income_tax
    end

    def income_tax(annual_salary)
      return taxable_amount(annual_salary) * rate if max.nil? || annual_salary < max

      max_income_tax
    end

    def minimum_range_operand
      min + MINIMUM_OPERAND_OFFSET # if min is 20001 then operand is 20000
    end

    def taxable_amount(annual_salary)
      annual_salary - minimum_range_operand
    end
  end
end
