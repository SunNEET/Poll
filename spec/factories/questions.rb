FactoryGirl.define do 

  factory :question do
    statement Faker::University.name
    poll # belongs to poll
  end
end