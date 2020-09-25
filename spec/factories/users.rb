FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "#{n}_#{Faker::Internet.email}"}
    nickname { Faker::Internet.username }
    password {'password'}
    # plant
    # trait :with_plant do
    #   association :plant, factory: :plant
    #   # plant
    # end

  end
end
