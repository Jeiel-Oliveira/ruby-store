class Order < ApplicationRecord
  enum :pay_type, {
    check: 0,
    credit_card: 1,
    purchase_order: 2
  }

  validates :name, :address, :email, :pay_type, presence: true
  validates :pay_type, inclusion: pay_types.keys

  has_many :line_items, dependent: :destroy

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
