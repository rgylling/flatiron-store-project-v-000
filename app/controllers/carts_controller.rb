class CartsController < ApplicationController

  def show
    @cart = Cart.find_by(params[:id])
  end

  def checkout
    @cart = Cart.find(params[:id])
    @cart.checkout
    current_user.current_cart.destroy
    redirect_to cart_path(@cart)
  end
  
end
