FactoryGirl.define do
  factory :product do
    # title 'Lorem Ipsum'
    sequence(:title) { |i| "Lorem Ipsum#{i}" }
    description 'Wibbles are fun!'
    image_url 'lorem.jpg'
    price 19.95
  end
end