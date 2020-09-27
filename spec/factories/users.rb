FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "#{n}_#{Faker::Internet.email}"}
    nickname { Faker::Internet.username }
    password {'password'}
    trait :with_plant do
      plants{[FactoryBot.build(:plant, user: nil)]}
    end
  end
end
