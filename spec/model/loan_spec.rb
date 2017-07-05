RSpec.describe Loan, "#returned_amount" do 
  it "sums payments" do
    loan=Loan.new
    loan.payments.build(amount: 1000)
    loan.payments.build(amount: 2000)
    expect(loan.returned_amount).to eq 3000
  end
end

RSpec.describe Loan, "#profit" do 
  it "sums payments" do
    loan=Loan.new(amount: 2000)
    loan.payments.build(amount: 1000)
    loan.payments.build(amount: 2000)
    expect(loan.profit).to eq 1000
  end
end

RSpec.describe Loan, "#profitability" do 
  it "calculates profitability" do
    loan=Loan.new(amount: 2000)
    loan.payments.build(amount: 1000)
    loan.payments.build(amount: 2000)
    expect(loan.profitability).to eq 1.0
  end
end

RSpec.describe Loan, ".profitability" do 
  it "calculates overall profitability" do
    loan=Loan.create(amount: 2000)
    loan.payments.create(amount: 1000)
    loan.payments.create(amount: 2000)
    loan=Loan.create(amount: 3000)
    loan.payments.create(amount: 2000)
    loan.payments.create(amount: 2000)
    expect(Loan.profitability).to eq 0.8
  end
end

RSpec.describe Loan, ".reset!" do 
  it "resets all loans to defaults" do
    loan=Loan.reset!
    expect(Loan.count).to eq 3
  end
end
