FactoryGirl.define do
  factory :line_item do
    # sequence(:title) { |i| "Lorem Ipsum#{i}" }
    # description 'Wibbles are fun!'
    # image_url 'lorem.jpg'
    # price 19.95
    product_id 1
    cart_id 1
  end
end