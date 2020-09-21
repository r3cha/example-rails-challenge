
class ChargeSerializer < ActiveModel::Serializer
  attribute :created_at, key: :created
  attribute :amount_cents, key: :amount
  attributes :id, :paid, :currency, :refunded, :customer_id
end
