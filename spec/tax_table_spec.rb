require 'spec_helper'

RSpec.describe IncomeTax::TaxTable do

  describe "#compute_income_tax" do
    it "returns 6000 on 60000 annual salary" do
      tax_table = IncomeTax::TaxTable.new(60000)
      expect(tax_table.compute_income_tax).to eq 6000
    end

    it "returns 10000 on 80000 annual salary" do
      tax_table = IncomeTax::TaxTable.new(80000)
      expect(tax_table.compute_income_tax).to eq 10000
    end

    it "returns 48000 on 200000 annual salary" do
      tax_table = IncomeTax::TaxTable.new(200000)
      expect(tax_table.compute_income_tax).to eq 48000
    end
  end
end
