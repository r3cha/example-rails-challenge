require 'rails_helper'

RSpec.describe Customer, type: :model do

  context "Has successful charges" do
    it 'Has 10 charges linked with customers' do
      customer_first = create :customer, :first
      customer_second = create :customer, :second
      customer_third = create :customer, :third
      customer_fourth = create :customer, :fourth

      5.times do
        create :charge, customer: customer_first
      end

      3.times do
        create :charge, customer: customer_second
      end

      create :charge, customer: customer_third
      create :charge, customer: customer_fourth

      expect(customer_first.charges.count).to be(5)
      expect(customer_second.charges.count).to be(3)
      expect(customer_third.charges.count).to be(1)
      expect(customer_fourth.charges.count).to be(1)

      expect(Charge.all.pluck(:paid)).to all(be_truthy)
    end
  end

  context "Has failed charges" do
    it 'Has 5 charges linked with customers 3 and 4' do
      customer_third = create :customer, :third
      customer_fourth = create :customer, :fourth

      3.times do
        create :charge, :failed, customer: customer_third
      end

      2.times do
        create :charge, :failed, customer: customer_fourth
      end

      expect(customer_third.charges.count).to be(3)
      expect(customer_fourth.charges.count).to be(2)

      expect(customer_third.charges.pluck(:paid)).to all(be_falsey)
      expect(customer_fourth.charges.pluck(:paid)).to all(be_falsey)
    end
  end

  context "Has disputed charges" do
    it "Able to attach disputed charges" do

      customer_first = create :customer, :first
      customer_second = create :customer, :second

      3.times do
        create :charge, :disputed, customer: customer_first
      end

      2.times do
        create :charge, :disputed, customer: customer_second
      end

      expect(customer_first.charges.count).to be(3)
      expect(customer_second.charges.count).to be(2)

      expect(customer_first.charges.pluck(:refunded)).to all(be_truthy)
      expect(customer_second.charges.pluck(:refunded)).to all(be_truthy)
    end
  end

end
