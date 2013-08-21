FactoryGirl.define do
  factory :user do
    sequence(:name) { |i| "user#{i}" }
    password_digest 'password'
    password 'password'
    password_confirmation 'password'
  end
end