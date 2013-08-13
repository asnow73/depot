require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = FactoryGirl.create(:product)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    @attr_product = FactoryGirl.attributes_for(:product)
    assert_difference('Product.count') do
      post(:create, product: @attr_product )
    end
    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    @attr_product = FactoryGirl.attributes_for(:product)
    patch :update, id: @product, product: @attr_product

    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end

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
    new_product = FactoryGirl.build(:product)
    new_product.title = @product.title
    assert !new_product.save
  end
end
