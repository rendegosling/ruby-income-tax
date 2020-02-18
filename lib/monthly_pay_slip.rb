module IncomeTax
  class MonthlyPaySlip

    TWELVE_MONTHS = 12.0

    attr_reader :employee, :tax_table
    def initialize(employee, tax_table)
      @employee = employee
      @tax_table = tax_table
    end

    def employee_name
      @employee_name ||= employee.name
    end

    def gross_monthly_income
      @gross_monthly_income ||= employee.annual_salary / TWELVE_MONTHS
    end

    def monthly_income_tax
      @monthly_income_tax ||= tax_table.compute_income_tax / TWELVE_MONTHS
    end

    def net_monthly_income
      @net_monthly_income ||= gross_monthly_income - monthly_income_tax
    end
  end
end
