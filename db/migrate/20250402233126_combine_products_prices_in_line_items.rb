class CombineProductsPricesInLineItems < ActiveRecord::Migration[8.0]
  def up
    LineItem.all.each do |line_item|
      line_item.price = line_item.product.price

      if line_item.quantity > 1
        line_item.price *= line_item.quantity
      end

      line_item.save!
    end
  end

  def down
    LineItem.all.each do |line_item|
      line_item.price = nil
      line_item.save!
    end
  end
end
