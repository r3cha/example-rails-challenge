# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

customer_first = FactoryBot.create :customer, :first
customer_second = FactoryBot.create :customer, :second
customer_third = FactoryBot.create :customer, :third
customer_fourth = FactoryBot.create :customer, :fourth

5.times do
  FactoryBot.create :charge, customer: customer_first
end

3.times do
  FactoryBot.create :charge, :disputed, customer: customer_first
  FactoryBot.create :charge, customer: customer_second
  FactoryBot.create :charge, :failed, customer: customer_fourth
end

2.times do
  FactoryBot.create :charge, :disputed, customer: customer_second
  FactoryBot.create :charge, :failed, customer: customer_fourth
end

FactoryBot.create :charge, customer: customer_third
FactoryBot.create :charge, customer: customer_fourth
