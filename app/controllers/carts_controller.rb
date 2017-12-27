class CartsController < ApplicationController
  def show
     @cart = current_user.current_cart
 end

 def checkout
     cart = Cart.find_by(id: params[:id])
     cart.check_out
     current_user.remove_current_cart
     redirect_to cart
 end
end
