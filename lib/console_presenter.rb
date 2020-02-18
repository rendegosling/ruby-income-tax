module IncomeTax
  class ConsolePresenter
    attr_reader :pay_slip
    def initialize(pay_slip)
      @pay_slip = pay_slip
    end

    def present
      puts "Monthly Payslip for: \"#{pay_slip.employee_name}\""
      puts "Gross Monthly Income: $#{pay_slip.gross_monthly_income}"
      puts "Monthly Income Tax: $#{pay_slip.monthly_income_tax}"
      puts "Net Monthly Income: $#{pay_slip.net_monthly_income}"
    end
  end
end