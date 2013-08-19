require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    order = FactoryGirl.create(:order_with_line_items)
    mail = OrderNotifier.received(order)
    assert_equal "Подтверждение заказа в Pragmatic Store", mail.subject
    assert_equal ["lora@mail.ru"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /1 x Lorem Ipsum/, mail.body.encoded
  end

  test "shipped" do
    order = FactoryGirl.create(:order_with_line_items)
    mail = OrderNotifier.shipped(order)
    assert_equal "Заказ из Pragmatic Store отправлен", mail.subject
    assert_equal ["lora@mail.ru"], mail.to
    assert_equal ["depot@example.com"], mail.from
    # assert_match /<td>1 &times;<\/td><td>Lorem Ipsum4<\/td>/, mail.body.encoded
    assert_match /<td>1 &times;<\/td>\r\n  <td>Lorem Ipsum[0-9]*<\/td>/, mail.body.encoded
  end

end
