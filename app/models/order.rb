class Order < ApplicationRecord
  validates :mobilenumber, presence: true,numericality: true,length: { minimum: 10, maximum: 12 }
  validates :postalcode, presence: true,numericality: true,length: {minimum: 6, maximum: 6}
  validates :Line1, presence: true
  validates :Line2, presence: true

  after_create:order_placed

  belongs_to :pay
  belongs_to :user
  has_many :cartitems, dependent: :destroy

  def add_line_items_from_cart(cart)
    cart.cartitems.each do |item|
      item.cart_id = nil
      cartitems << item
    end
  end
  def order_placed
    puts "Thank you for placing order ,Thank you mail has been sent successfully"
  end
  
end
