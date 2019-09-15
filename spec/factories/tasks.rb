FactoryBot.define do
  factory :task do
    user
    name { Faker::Address.name }
  end
end
