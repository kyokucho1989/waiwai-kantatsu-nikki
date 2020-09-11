FactoryBot.define do
  factory :user do
    email {Faker::Internet.email}
    nickname { Faker::Internet.username }
    password {'password'}

  end
end
