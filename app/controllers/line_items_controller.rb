class LineItemsController < ApplicationController
  include CurrentCart

  before_action :set_cart, only: %i[ create ]
  before_action :set_line_item, only: %i[ update destroy ]

  # POST /line_items or /line_items.json
  def create
    @product = Product.find(params[:product_id])
    @line_item = @cart.add_product(@product)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart, notice: t(".success") }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1 or /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item.cart, notice: t(".success") }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1 or /line_items/1.json
  def destroy
    @line_item.destroy!

    respond_to do |format|
      format.html { redirect_to root_path, status: :see_other, notice: t(".success") }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_line_item
    @line_item = LineItem.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def line_item_params
    params.require(:line_item).permit(:product_id)
  end
end
