
FactoryBot.define do
  factory :charge do
    paid { true }
    refunded { false }
    amount_cents { rand(1..42000) }
    association :customer

    trait :failed do
      paid { false }
    end

    trait :disputed do
      refunded { true }
    end
  end
end
