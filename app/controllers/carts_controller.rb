class CartsController < ApplicationController
  def show
      @cart = Cart.find_by(id: params[:id])
 end

 def checkout
     cart = Cart.find_by(id: params[:id])
     cart.check_out
     redirect_to cart
 end
end
