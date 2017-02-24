FactoryGirl.define do

  factory :user do
    # sequence(:email) { |n| "user#{n}@test.com" }
    email { Faker::Internet.free_email }
    password Faker::Internet.password
  end

  factory :admin, class: User do
    # sequence(:email) { |n| "admin#{n}@test.com" }
    email { Faker::Internet.free_email }
    password Faker::Internet.password
    admin true
  end

end
    