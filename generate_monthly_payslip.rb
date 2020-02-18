$LOAD_PATH << File.dirname(__FILE__)
require 'lib/employee'
require 'lib/tax_table'
require 'lib/monthly_pay_slip'
require 'lib/console_presenter'

EMPLOYEE_NAME_ARG_INDEX = 0
ANNUAL_SALARY_ARG_INDEX = 1

employee = IncomeTax::Employee.new(ARGV[EMPLOYEE_NAME_ARG_INDEX], ARGV[ANNUAL_SALARY_ARG_INDEX].to_i)
tax_table = IncomeTax::TaxTable.new(employee.annual_salary)
pay_slip = IncomeTax::MonthlyPaySlip.new(employee, tax_table)
IncomeTax::ConsolePresenter.new(pay_slip).present
