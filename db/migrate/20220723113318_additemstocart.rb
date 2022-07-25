class Additemstocart < ActiveRecord::Migration[6.0]
  def change
  end
  def up
    Cart.all.each do |cart|
      sums = cart.cartitems.group(:product_id).sum(:quantity)
      sums.each do |product_id, quantity|
        if quantity > 1
          cart.cartitems.where(product_id: product_id).delete_all
          item = cart.cartitems.build(product_id: product_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end

  def down
    Cartitem.where("quantity>1").each do |cartitem|
      cartitem.quantity.times do
        Cartitem.create(
          cart_id: cartitem.cart_id,
          product_id: cartitem.product_id,
          quantity: 1
        )
      end
    cartitem.destroy
    end
  end
end
