
FactoryBot.define do
  factory :customer do
    first_name { 'John' }
    last_name { 'Doe' }

    trait :first do
      first_name { 'Johny' }
      last_name { 'Flow' }
    end

    trait :second do
      first_name { 'Raj' }
      last_name { 'Jamnis' }
    end

    trait :third do
      first_name { 'Andrew' }
      last_name { 'Chung' }
    end

    trait :fourth do
      first_name { 'Mike' }
      last_name { 'Smith' }
    end
  end
end
