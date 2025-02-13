class Product::Review < ApplicationRecord
  belongs_to :product
  has_rich_text :description

  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :description, presence: true
end
