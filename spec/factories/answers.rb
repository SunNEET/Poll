FactoryGirl.define do 

  factory :answer do
    user
    question # belongs to question
  end
end