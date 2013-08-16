require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = FactoryGirl.create(:order)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "requires item in cart" do
    get :new
    assert_redirected_to store_path
    assert_equal flash[:notice], 'Your cart is empty'
  end

  test "should get new" do
    cart = FactoryGirl.create(:cart)
    product = FactoryGirl.create(:product)
    session[:cart_id] = cart.id
    LineItem.create(cart: cart, product: product)
    get :new
    assert_response :success
  end

  test "should create order" do
    attr_order = FactoryGirl.attributes_for(:order)
    assert_difference('Order.count') do
      post :create, order: attr_order
    end

    assert_redirected_to store_path
  end

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    attr_order = FactoryGirl.attributes_for(:order)
    patch :update, id: @order, order: attr_order
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end
end
