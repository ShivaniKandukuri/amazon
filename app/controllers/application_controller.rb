class ApplicationController < ActionController::Base
   before_action :authenticate_user!
   def set_cart
     @cart = Cart.find(session[:cart_id])
     @cart = Cart.create
     session[:cart_id] = @cart.id
   end
end
