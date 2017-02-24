require 'ffaker'

FactoryGirl.define do 

  factory :question do
    statement "blahblahblah....."
    poll # belongs to poll
  end
end