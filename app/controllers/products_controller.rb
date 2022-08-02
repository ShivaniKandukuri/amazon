class ProductsController < ApplicationController
  before_action :set_product, only: [:show,:edit,:update,:destroy,:wishlist]
  before_action :require_user, except: [:show, :index]
  before_action :require_admin_user, only: [:create,:edit, :update, :destroy]
  def index
   @products=Product.paginate(page: params[:page], per_page: 3)
  #@products = Product.search(params[:search])

  end
  def search
    @products = Product.where("name LIKE ?","%"+params[:q]+"%")
  end
  def wishlist
    Wishlist.create(user_id:current_user.id,product_id:@product.id)
    redirect_to products_path
  end
  def new
    @product=Product.new
  end
  def create
    @product=Product.new(product_params)
    if @product.save
      flash[:notice]="Product created sucessfully"
      redirect_to @product
    else
      render 'new'
    end
  end
  def edit
  end
  def update
    if @product.update(product_params)
      flash[:notice]="Product updated successfully"
      redirect_to @product
    else
      render 'edit'
    end
  end
  def destroy
    @product.destroy
    redirect_to products_path
  end
  private
  def set_product
    @product=Product.find(params[:id])
  end
  def product_params
    params.require(:product).permit(:name,:price,:description,:rating,:category_id)
  end
  def require_admin_user
    if current_user.role!='admin'
      flash[:alert] = "Admin can only modify products"
      redirect_to @product
    end
  end
end
