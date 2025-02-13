class CreateProductReviews < ActiveRecord::Migration[8.0]
  def change
    create_table :product_reviews do |t|
      t.belongs_to :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
