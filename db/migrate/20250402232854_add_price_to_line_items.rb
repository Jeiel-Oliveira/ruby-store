class AddPriceToLineItems < ActiveRecord::Migration[8.0]
  def change
    add_column :line_items, :price, :float
  end
end
