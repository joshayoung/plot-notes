require "faker"

FactoryBot.define do
  factory :list do
    title Faker::Team.sport
  end
end
