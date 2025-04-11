class CombineItemsInCart < ActiveRecord::Migration[8.0]
  def up
    Cart.all.each do |cart|
      sums = cart.line_items.group(:product_id).sum(:quantity)
      sums.each do |product_id, quantity|
        if quantity > 1
          cart.line_items.where(product: product_id).delete_all

          # build can create a new line item without saving it to the database
          item = cart.line_items.build(product_id: product_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end

  # down is the reverse of the up and it's important to implement it
  # if we want to be able to roll back the migration
  def down
    LineItem.where("quantity>1").each do |line_item|
      line_item.quantity.times do
        LineItem.create(
          cart_id: line_item.cart_id,
          product_id: line_item.product_id,
          quantity: 1
        )
      end

      line_item.destroy
    end
  end
end
