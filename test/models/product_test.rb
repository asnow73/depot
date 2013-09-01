require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "product price must be positive" do
    product = FactoryGirl.build(:product)
    product.price = -1
    assert product.invalid?
    product.price = 0
    assert product.invalid?
    product.price = 1
    assert product.valid?
  end

  test "image url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }
    ok.each do |name|
      product = FactoryGirl.build(:product, image_url: name)
      assert product.valid?
    end

    bad.each do |name|
      product = FactoryGirl.build(:product, image_url: name)
      assert product.invalid?
    end
  end

  test "product is not valid without a unique title" do
    product = FactoryGirl.create(:product)
    new_product = FactoryGirl.build(:product)
    new_product.title = product.title
    assert !new_product.save
  end

end
