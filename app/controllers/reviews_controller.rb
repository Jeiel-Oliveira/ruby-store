class ReviewsController < ApplicationController
  allow_unauthenticated_access
  before_action :set_product

  def new
    @review = Product::Review.new
  end

  def create
    @review = @product.reviews.new(review_params)
    if @review.save
      redirect_to @product, notice: "Review was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def review_params
    params.expect(product_review: [ :rating, :description ])
  end
end
