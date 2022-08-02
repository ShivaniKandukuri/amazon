class CartsController < ApplicationController
 before_action :set_cart, only: [:show, :destroy]
  def index
    @carts = []
    if session[:cart_id] != nil
      @carts << Cart.find_by_id(session[:cart_id])
    end
  end
  def new
    @cart=Cart.new
  end
  def show
  end

  def create
    @cart=Cart.new(cart_params)
    if @cart.save
      flash[:notice]="cart created successfully"
      redirect_to @cart
    else
      render 'new'
    end
  end
  def destroy
    @cart.destroy
    flash[:notice]="cart cleared successfully"
    redirect_to products_path
  end
  private
  def set_cart
    @cart=Cart.find(params[:id])
  end
  def cart_params
    params.fetch(:cart, {})
  end

end
