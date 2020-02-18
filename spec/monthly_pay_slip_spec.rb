require 'spec_helper'

RSpec.describe IncomeTax::MonthlyPaySlip do
  let(:employee) { double("employee") }
  let(:tax_table) { double("tax_table") }

  before do
    allow(employee).to receive(:name).and_return("Ren")
    allow(employee).to receive(:annual_salary).and_return(120000)
    allow(tax_table).to receive(:compute_income_tax).and_return(12000)
  end

  describe "employee_name" do
    it { expect(IncomeTax::MonthlyPaySlip.new(employee, tax_table).employee_name).to eq "Ren" }
  end

  describe "gross_monthly_income" do
    it { expect(IncomeTax::MonthlyPaySlip.new(employee, tax_table).gross_monthly_income).to eq 10000 }
  end

  describe "monthly_income_tax" do
    it { expect(IncomeTax::MonthlyPaySlip.new(employee, tax_table).monthly_income_tax).to eq 1000 }
  end

  describe "net_monthly_income" do
    it { expect(IncomeTax::MonthlyPaySlip.new(employee, tax_table).net_monthly_income).to eq 9000 }
  end
end
