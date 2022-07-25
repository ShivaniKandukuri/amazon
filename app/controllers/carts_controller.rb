class CartsController < ApplicationController
 before_action :set_cart, only: [:show, :edit, :update, :destroy]
  def index
    @carts = []
    if session[:cart_id] != nil
      @carts << Cart.find_by_id(session[:cart_id])
    end
  end
  def show
  end
  def new
    @cart=Cart.new
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
  def edit
  end
  def update
    if @cart.update(cart_params)
      flash[:notice]="cart updated successfully"
      redirect_to @cart
    else
      render 'edit'
    end
  end
  def destroy
    @cart.destroy
    redirect_to carts_path
  end
  private
  def set_cart
    @cart=Cart.find(params[:id])
  end
  def cart_params
    params.fetch(:cart, {})
  end

end
