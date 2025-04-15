class Product < ApplicationRecord
  include Notifications

  has_many :subscribers, dependent: :destroy
  has_many :reviews, class_name: "Product::Review", dependent: :destroy
  has_many :line_items
  has_many :orders, through: :line_items

  has_one_attached :featured_image
  has_rich_text :description

  validates :name, presence: true
  validates :inventory_count, numericality: { greater_than_or_equal_to: 0 }

  before_destroy :ensure_not_referenced_by_any_line_item

  private

  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, I18n.t("products.errors.line_items_present"))
      throw :abort
    end
  end
end
