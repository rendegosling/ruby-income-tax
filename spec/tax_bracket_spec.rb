require 'spec_helper'

RSpec.describe IncomeTax::TaxBracket do
  describe "#income_tax" do
    context "when annual salary within tax bracket range" do
      it "computes the product of the taxable amount and rate" do
        tax_bracket = IncomeTax::TaxBracket.new(min: 0, max: 20000, rate: 0, max_income_tax: 0)
        expect(tax_bracket.income_tax(50)).to eq 0

        tax_bracket = IncomeTax::TaxBracket.new(min: 20001, max: 40000, rate: 0.1, max_income_tax: 2000.0)
        expect(tax_bracket.income_tax(20001)).to eq 0.1

        tax_bracket = IncomeTax::TaxBracket.new(min: 180001, max: nil, rate: 0.4, max_income_tax: nil)
        expect(tax_bracket.income_tax(200000)).to eq 8000

        tax_bracket = IncomeTax::TaxBracket.new(min: 40001, max: 80000, rate: 0.2, max_income_tax: 8000.0)
        expect(tax_bracket.income_tax(60000)).to eq 4000
      end
    end
  end

  describe "#minimum_range_operand" do
    it "returns minimum tax range bracket minus 1 unit" do
      tax_bracket = IncomeTax::TaxBracket.new(min: 20001, max: 40000, rate: 0.1, max_income_tax: 2000.0)
      expect(tax_bracket.minimum_range_operand).to eq 20000
    end
  end

  describe "#taxable_amount" do
    it "returns the difference of annual salary and minimum operand" do
      tax_bracket = IncomeTax::TaxBracket.new(min: 20001, max: 40000, rate: 0.1, max_income_tax: 2000.0)
      expect(tax_bracket.taxable_amount(20100)).to eq 100
    end
  end
end
