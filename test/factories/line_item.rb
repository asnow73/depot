FactoryGirl.define do
  factory :line_item do
    # product_id 1
    # cart_id 1
    product
    order
    cart
  end
end