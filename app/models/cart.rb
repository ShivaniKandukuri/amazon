class Cart < ApplicationRecord
  has_many :cartitems, dependent: :destroy
  def add_product(product)
    current_item = cartitems.find_by(product_id: product.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = cartitems.build(product_id: product.id)
    end
    current_item
  end
  def totalcartprice
    cartitems.collect{|cartitem| cartitem.valid? ? cartitem.total_price : 0}.sum
  end
end
