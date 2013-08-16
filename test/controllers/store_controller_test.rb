require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    product = FactoryGirl.create(:product)

    get :index
    assert_response :success
    assert_select '#columns #side a', minimum: 4
    assert_select '#main .entry', 1
    assert_select '.price', /\$[,\d]+\.\d\d/
  end

  test "markup needed for store.js.coffee is in place" do
    FactoryGirl.create(:product)
    get :index
    assert_select '.store .entry > img', 1
    assert_select '.entry input[type=submit]', 1
  end


end
