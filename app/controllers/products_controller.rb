class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  allow_unauthenticated_access only: %i[ index show ]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: "Product was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product
      ActionCable.server.broadcast "products", {
        action: "product_updated",
        product: {
          id: @product.id,
          name: @product.name,
          description: @product.description.body,
          price: @product.price,
          inventory_count: @product.inventory_count
        }
      }
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    was_destroyed = @product.destroy
    unless was_destroyed
      return redirect_to request.referer, alert: @product.errors.full_messages.join(", ")
    end

    redirect_to products_path, notice: "Product was successfully destroyed."
  end

  private

  def set_product
    @product = Product.find(params[:id])
    @reviews = Product::Review.where(product_id: params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.expect(product: [ :name, :description, :featured_image, :inventory_count, :price ])
  end
end
