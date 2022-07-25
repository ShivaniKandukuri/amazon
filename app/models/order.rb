class Order < ApplicationRecord
  has_many :cartitems, dependent: :destroy
  def add_cartitems_from_cart(cart)
    cart.cartitems.each do |item|
      item.cart_id = nil
      cartitems << item
    end
  end
end