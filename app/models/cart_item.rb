class CartItem < ApplicationRecord
  before_action :set_cart, only: [:create, :destroy]
  belongs_to :cart

  def create
    @cart.add_product(params)

    if @cart.save
      redirect_to cart_path
    else
      flash[:error] = 'There was a problem assing this item to your cart.'
      redirect_to @product
    end
  end
  def destroy
    @cart_item.destroy
    redirect_to cart_path
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end
  def cart_item_params
    params.require(:cart_item).permit(:product_id, :cart_id, :quantity)
end
