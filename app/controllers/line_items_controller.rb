class LineItemsController < ApplicationController
  def create
      if !current_user.current_cart
          current_user.current_cart = Cart.new
          current_user.save
      end
      
      line_item = current_user.current_cart.add_item(params[:item_id])
      
      if line_item.save
          redirect_to cart_path(current_user.current_cart)
      else
          redirect_to store_path
      end
  end
end
