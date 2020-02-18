module IncomeTax
  class Employee
    attr_reader :name, :annual_salary

    def initialize(name, annual_salary)
      @name = name
      @annual_salary = annual_salary
    end
  end
end
