FactoryBot.define do
  factory :plant do
    user
    plant_name { Faker::Name.middle_name }

  end
end