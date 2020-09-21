class Charge < ApplicationRecord
  belongs_to :customer
  register_currency :usd

  def currency
    amount_currency
  end
end
