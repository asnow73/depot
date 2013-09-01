FactoryGirl.define do
  factory :order do
    sequence(:name) { |i| "Lora#{i}" }
    address 'address!'
    email 'lora@mail.ru'
    pay_type 'Check'

    factory :order_with_line_items do
      after(:create) do |order|
        #FactoryGirl.create_list(:line_item, 1, order: order)
        product = FactoryGirl.create(:product)
        line_item = FactoryGirl.create(:line_item, product_id: product.id, cart_id: nil, order: order)
        #order.line_items << line_item
      end
    end
  end
end