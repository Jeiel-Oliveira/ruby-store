class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  validates :quantity, presence: true, numericality: { greater_than: 0 }

  def total_price
    product.price * quantity
  end
end
