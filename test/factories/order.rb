FactoryGirl.define do
  factory :order do
    sequence(:name) { |i| "Lora#{i}" }
    address 'address!'
    email 'lora@mail.ru'
    pay_type 'Check'
  end
end