FactoryBot.define do
  factory :plant do
    plant_name { Faker::Name.middle_name }
    user
  end
end