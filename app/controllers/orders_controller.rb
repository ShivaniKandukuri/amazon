class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:new, :create]
  before_action :ensure_cart_isnt_empty, only: :new
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  def index
    @q=Order.ransack(params[:q])
    @orders=@q.result(distinct:true)
  end
  def show
  end
  def new
    @order = Order.new
  end

  def edit
  end
  def create
    @order = Order.new(order_params)
    @order.name=current_user.name
    @order.add_cartitems_from_cart(@cart)
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        flash[:notice]="Thank you for order"
        redirect_to products_path
      else
        render 'new'
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        flash[:notice]="Order updated successfully"
        redirect_to @order
      else
        render 'edit'
      end
    end
  end
  def destroy
    @order.destroy
    redirect_to orders_path
  end

  private
  def set_order
    @order = Order.find(params[:id])
  end
    def order_params
      params.require(:order).permit(:name,:address)
    end

    def ensure_cart_isnt_empty
      if @cart.cartitems.empty?
      redirect_to products_path, notice: 'Your cart is empty'
      end
    end
