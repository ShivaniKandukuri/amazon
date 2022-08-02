class WishlistsController < ApplicationController
  def index
    @wishlist = current_user.products
  end

  def new
    @wishlist = wishlist.new
  end

  def create
    @wishlist = current_user.wishlists.create(id: params[:id])
    redirect_to products_path
  end

end
