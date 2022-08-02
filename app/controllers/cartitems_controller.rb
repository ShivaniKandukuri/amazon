class CartitemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_cartitem,only:[:show,:edit,:update,:destroy]
  def index
    @cartitems=Cartitem.all
  end
  def show
  end
  def new
    @cartitem=Cartitem.new
  end

  def create
     product = Product.find(params[:product_id])
     @cartitem = @cart.add_product(product)
    if @cartitem.save
      flash[:notice]="cartitem created successfully"
      @current_item = @cartitem
      redirect_to @cartitem
    else
      render 'new'
    end
  end
  def edit
  end
  def update
    if @cartitem.update(cartitem_params)
      flash[:notice]="cartitem updated successfully"
      redirect_to @cartitem
    else
      render 'edit'
    end
  end
  def destroy
    @cartitem.destroy
    flash[:notice]="cartitem deleted"
    redirect_to cartitems_path
  end
  private
  def set_cartitem
    @cartitem=Cartitem.find(params[:id])
  end
  def cartitem_params
    params.require(:cartitem).permit(:product_id, :cart_id)
  end

end
