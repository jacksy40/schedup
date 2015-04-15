require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :task do
    sequence(:tasks) {|n| "task#{n}" }
    sequence(:task_date) {|n| "2015-04-15" }
    sequence(:task_time) {|n| "07:00PM" }
    sequence(:location) {|n| "location#{n}" }
  end

  factory :availability do
    sequence(:avail_date) {|n| "2015-04-15" }
    sequence(:avail_time) {|n| "07:00PM" }
  end

end
