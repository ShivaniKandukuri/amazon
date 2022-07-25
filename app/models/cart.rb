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
  def total_price
    cartitems.to_a.sum { |item| item.total_price }
  end
end
