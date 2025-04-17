require "test_helper"

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderMailer.received(orders(:one))
    assert_equal "Store Order Confirmation", mail.subject
    assert_equal [ orders(:one).email ], mail.to
    assert_equal [ "store@example.com" ], mail.from
    assert_match (/Simple Blue Shirt/), mail.body.encoded
  end

  test "shipped" do
    mail = OrderMailer.shipped(orders(:one))
    assert_equal "Store Order Shipped", mail.subject
    assert_equal [ orders(:one).email ], mail.to
    assert_equal [ "store@example.com" ], mail.from
  end
end
