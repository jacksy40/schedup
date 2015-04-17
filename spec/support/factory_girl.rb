require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :task do
    sequence(:tasks) {|n| "task#{n}" }
    sequence(:task_date) {|n| Date.current }
    sequence(:task_time) {|n| Date.current + n.seconds }
    sequence(:location) {|n| "location#{n}" }
  end

  factory :availability do
    sequence(:avail_date) {|n| Date.current }
    sequence(:avail_time) {|n| "09:00AM" }
  end

end

